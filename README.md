# Allscale SDK Template

Be aware, altering files from this repository may yield merge conflicts upon
updating. The setup script will replace this README, you are free to change and
commit it afterwards.

Fork this and run the setup utility providing a project name, use lowercase
letters, digits and underscores only. An module named `app` will be added
automatically:

    $ scripts/setup/run <project-name>

You can use the script to add new, empty modules, just use the same project
name. Example:

    $ scripts/setup/run demo_app utils

If your project does not required multiple modules, keep all code inside the
`app` module.

Additionally a script is provided to add new *parts* to a module. The target
module must already exist and you have to provide the same project-name.

    $ scripts/setup/add_part demo_app utils sema

Previous command adds a `sema.h`, `sema.cpp` and `sema_test.cc` to the
corresponding directories of the *utils* module. You can also supply multiple
*parts*.

    $ scripts/setup/add_part demo_app utils sema extensions/malloc_extension

Subdirectories inside a module are created along the way as needed.
