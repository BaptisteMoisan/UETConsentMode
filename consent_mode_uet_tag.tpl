___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Consent Mode (Microsoft UET tags)",
  "brand": {
    "id": "brand_dummy",
    "displayName": ""
  },
  "description": "",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "SELECT",
    "name": "command",
    "displayName": "Consent Command",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "default",
        "displayValue": "Default"
      },
      {
        "value": "update",
        "displayValue": "Update"
      }
    ],
    "simpleValueType": true,
    "defaultValue": "default",
    "help": "Use \u003cstrong\u003eDefault\u003c/strong\u003e command before any consent status is given by user. Use \u003cstrong\u003eUpdate\u003c/strong\u003e when the consent status is given."
  },
  {
    "type": "SELECT",
    "name": "status",
    "displayName": "Consent Status",
    "macrosInSelect": true,
    "selectItems": [
      {
        "value": "granted",
        "displayValue": "granted"
      },
      {
        "value": "denied",
        "displayValue": "denied"
      }
    ],
    "simpleValueType": true,
    "defaultValue": "denied",
    "help": "Only for \u003cstrong\u003ead_storage\u003c/strong\u003e signal."
  },
  {
    "type": "GROUP",
    "name": "Notice",
    "displayName": "Notice",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "LABEL",
        "name": "notice",
        "displayName": "This tag only works when using the default \u003cb\u003euetq\u003c/b\u003e variable with your Bing tags.\u003cbr\u003e\nThis tag can be used as a setup tag for all your Bing tags."
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const uetqPush = require('createQueue')('uetq');
const JSON = require('JSON');

// Consent Mode
uetqPush('consent', data.command, {'ad_storage': data.status});

data.gtmOnSuccess();


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "uetq"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: Untitled test 1
  code: |-
    const mockData = {
      em: "bm",
      ph: "abc",
      command: "default",
      status: "granted"
    };

    // Call runCode to run the template's code.
    runCode(mockData);

    // Verify that the tag finished successfully.
    assertApi('gtmOnSuccess').wasCalled();


___NOTES___

Created on 27/03/2024, 12:21:04


