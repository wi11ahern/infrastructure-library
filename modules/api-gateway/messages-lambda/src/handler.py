from typing import List, Dict
import json
import random
import logging

logger = logging.getLogger()
logger.setLevel(logging.INFO)


def lambda_handler(event, context):
    logger.info(f"Event received:\n{json.dumps(obj=event, indent=4)}")

    messages = [
        "Did you know that the sun is SUPER hot?",
        "I really like chocolate cake. Do you have some? No, but really?",
        "You're awesome!",
        "We are Borg. You will be assimilated!"
    ]

    response = {
        "statusCode": 200,
        "headers": {
            "Content-Type": "application/json"
        },
        "body": messages[random.randint(0, len(messages)-1)]
    }

    logger.info(f"Prepared response:\n {json.dumps(obj=response, indent=4)}")

    return response
