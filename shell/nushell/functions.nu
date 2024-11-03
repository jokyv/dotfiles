def activate-venv [venv_dir = '.nenv'] {
    let venv_path = (pwd | path join $venv_dir | path expand)
    
    if not ($venv_path | path exists) {
        error make {msg: $"Virtual environment directory '($venv_path)' does not exist"}
        return
    }

    let bin_dir = if $nu.os-info.name == "windows" { "Scripts" } else { "bin" }
    let venv_bin = ($venv_path | path join $bin_dir)
    
    # Modify PATH
    let old_path = $env.PATH
    let new_path = ($env.PATH | prepend $venv_bin)
    
    # Store the old environment variables
    let old_env = {
        PATH: $old_path
        VIRTUAL_ENV: $env.VIRTUAL_ENV?
        PYTHON_VIRTUAL_ENV: $env.PYTHON_VIRTUAL_ENV?
    }

    # Update environment
    $env.PATH = $new_path
    $env.VIRTUAL_ENV = $venv_path
    $env.PYTHON_VIRTUAL_ENV = $venv_path
    
    # Store the old environment so we can restore it on deactivate
    $env._OLD_VIRTUAL_PATH = $old_env.PATH
    $env._OLD_VIRTUAL_ENV = $old_env.VIRTUAL_ENV
    $env._OLD_PYTHON_VIRTUAL_ENV = $old_env.PYTHON_VIRTUAL_ENV
}
# Enhanced mkdir with verbose output
def mkdir-v [...paths] {
    $paths | each { |path|
        if ($path | path exists) {
            echo $"Directory '($path)' already exists"
        } else {
            mkdir $path
            echo $"Created directory '($path)'"
        }
    }
}

def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}

def create_left_prompt [] {
    let dir = ($env.PWD | str replace $env.HOME "~")
    let git_branch = (git branch --show-current | str trim)
    
    let dir_segment = $"(ansi green_bold)($dir)"
    let git_segment = if ($git_branch != "") { $"(ansi red_bold)[$git_branch]" } else { "" }
    
    $"($dir_segment)($git_segment)(ansi reset)> "
}
