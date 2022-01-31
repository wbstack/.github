# Repos

Semi autoamtic control of Github repos

You will need the github CLI to use this https://cli.github.com/ & jq https://stedolan.github.io/jq/

Generate the repos.json file

```sh
gh repo list wbstack --public --json name,description | jq > repos.json
```

You can then poke and apply these settings by altering the JSON file.

Some settings are hard coded in the script (such as wikis being turned off).

You can then apply these settings (If you have the appropriate access).

```sh
./repos.sh
```