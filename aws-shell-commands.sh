
# create slot type
aws \
lex-models put-slot-type \
    --region eu-west-1 \
    --name WheelTypes \
    --cli-input-json file:///Users/wernotto/shoutbikebot/WheelTypes.json

# delete slot type
aws \
lex-models delete-slot-type \
    --region eu-west-1 \
    --name WheelTypes

# show slot types
aws \
lex-models get-slot-types \
    --region eu-west-1

# create intent
aws \
lex-models put-intent \
    --region eu-west-1 \
    --name GetWheels \
    --cli-input-json file:///Users/wernotto/shoutbikebot/GetWheels.json

# delete intent 
aws \
lex-models delete-intent \
    --region eu-west-1 \
    --name GetWheels

# show intents
aws \
lex-models get-slot-types \
    --region eu-west-1

# create bot
aws \
lex-models put-bot \
    --region eu-west-1 \
    --name ShoutBikeBot \
    --cli-input-json file:///Users/wernotto/shoutbikebot/ShoutBikeBot.json

# delete bot
aws \
lex-models delete-bot \
    --region eu-west-1 \
    --name ShoutBikeBot

# show bot
aws lex-models get-bot \
    --region eu-west-1 \
    --name ShoutBikeBot \
    --version-or-alias "\$LATEST"

# test 1
aws lex-runtime post-text \
    --region eu-west-1 \
    --bot-name ShoutBikeBot \
    --bot-alias "\$LATEST" \
    --user-id UserOne \
    --input-text "I want wheels"

# test 2
aws \
lex-runtime post-text \
    --region eu-west-1 \
    --bot-name ShoutBikeBot \
    --bot-alias "\$LATEST" \
    --user-id UserOne \
    --input-text "shoutbike"

# create lambda function
aws \
lambda create-function \
    --function-name GetWheelsInvokeHookFunction \
    --runtime "python3.7" \
    --role "arn:aws:iam::174318856950:role/service-role/GetWheelsRole" \
    --handler "lambda_function.lambda_handler" \
    --function-name GetWheelsInvokeHookFunction \
    --runtime "python3.7" \
    --role "arn:aws:iam::174318856950:role/service-role/GetWheelsRole" \ 
    --handler "lambda_function.lambda_handler" \
    --function-name "GetWheelsInvokeHookFunction" \ 
    --code S3Bucket=string,S3Key=string,S3ObjectVersion=string \ 
    --region us-west-2 \
    --version "/$LATEST" 

# delete lambda function
aws \
lambda delete-function \
    --function-name "GetWheelsInvokeHookFunction"

# get function
aws \
lambda get-function \
    --function-name GetWheelsInvokeHookFunction

# Permissions
aws \
iam get-role \ 
    --role-name AWSServiceRoleForLexBots





lambda add-permission \
    --region eu-west-1 \
    --function-name GetWheelsInvokeHookFunction \
    --statement-id GetWheelsForShoutBikeBotStatement \
    --action lambda:InvokeFunction \
    --principal lex.amazonaws.com \
    --source-arn "arn:aws:lex:eu-west-1:174318856950:intent:GetWheels:*"
