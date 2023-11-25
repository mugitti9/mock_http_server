import os
import slackweb

slack = slackweb.Slack(url=os.environ["SLACK_WEBHOOK_URL"])

def send_slack(webhook_params):
  attachments = []
  for index, webhook_param_key in enumerate(webhook_params.keys()):
    webhook_param = webhook_params[webhook_param_key]
    if index == 0:
      attachment = {
                    "pretext": "webhookが送信されました", 
                    "title": webhook_param_key, 
                    "text": webhook_param, 
                    "color": "good"
                    }
    else:
      attachment = {
                    "title": webhook_param_key, 
                    "text": webhook_param, 
                    "color": "good"
                    }
    attachments.append(attachment)

  slack.notify(attachments=attachments)
  return "OK"
