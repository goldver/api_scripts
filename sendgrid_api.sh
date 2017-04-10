#!/bin/bash -ex

curl "https://api.sendgrid.com/v3/mail/send"\
 -X POST -H "Content-Type: application/json"\
 -H "Authorization: Bearer <token>" \
 -d @<(cat <<EOF
 {
  "personalizations": [
    {
      "to": [
        {"email": "test@mail.com"}
      ],
      "subject": "Test"
    }
  ],
  "from": {
    "email": "goldver@gmail.com"
  },
  "content": [
    {
      "type": "text/html",
      "value": "<br/> <br/> <br/>my text <br/>You can use this: <br/>http://some_referense"
    }
  ]
}
EOF
)
