# Overview
This repo is used to test if the successful applies counter increments when using local execution mode.

## Test

1. I ran terraform with CLI driven workflow and remote execution mode
2. I then ran the python script under test/terraform-successful-applies/secrets.sh to check for successful applies (it checks against the TFC API)
3. I saw the successful applies increment
4. I destroyed the terraform resources and once again saw the successful applies increment
5. Now I changed the workspace general settings to local execution mode.
6. I ran terraform again
7. I ran the python script to test for successful applies
8. The counter DID NOT increment

## Conclusion

For local execution mode, we don't count successful applies in TFC.