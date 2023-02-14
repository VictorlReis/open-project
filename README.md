# Open-Project

The Open-Project script allows you to easily change directories to a project or subdirectory. It is useful for quickly navigating to frequently used project folders in PowerShell.

### Usage

To use the script, add the following code to your PowerShell profile:

For example:  `o <project> <subfolder>`.

For example, to navigate to the `myproject-server` folder of the `myproject` project, type `o myproject server`.

You can also use the `-r` switch to automatically run the command `npm run start` after changing to the folder. For example, to navigate to the `myproject-server` folder of the `myproject` project and run `npm run start`, type `o myproject server -r`.

#### Adding New Projects or Subdirectories

To add a new project or subdirectory to the script, simply modify the script as follows:

- Add a new case statement to the switch statement for the project name, specifying the path to the project.
- Add a new case statement to the switch statement for the subdirectory, specifying the path to the subdirectory.
- Save the modified script and reload your PowerShell profile.

### Contributing

Contributions to this repository are welcome! If you have any useful Windows scripts, alias, or anything else, feel free to submit a pull request.

### License

This repository is licensed under the MIT license. See `LICENSE` for more information.
