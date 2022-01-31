#!/bin/bash

jq -c '.[]' repos.json | while read repo; do
    name=$(echo $repo | jq -r '.name' -)
    description=$(echo $repo | jq -r '.description' -)
    echo "Poking '${name}'"

    gh api --method PATCH /repos/wbstack/$name \
        --field description="$description"\
        --field has_wiki='false'

    gh api --method PUT /repos/wbstack/$name/branches/main/protection \
        --input=repos-default-protection.json
done
