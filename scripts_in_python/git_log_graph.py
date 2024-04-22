import subprocess


def git_log_graph() -> None:
    git_log_command = [
        "git",
        "log",
        "--graph",
        "--abbrev-commit",
        "--decorate",
        "--format=format:%C(bold green)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold yellow)(%ar)%C(reset)%C(auto)%d%C(reset)%n%C(white)%s%C(reset) %C(dim white)- %an%C(reset)",
        "--all",
    ]
    subprocess.run(git_log_command)


def main() -> None:
    git_log_graph()


if __name__ == "__main__":
    main()
