export const surveyJson = {
  "pages": [
   {
    "name": "page3",
    "elements": [
     {
      "type": "text",
      "name": "whichDayDoYouWantToEvaluate",
      "title": "Which day do you want to evaluate?",
      "isRequired": true,
      "inputType": "date",
      "minValueExpression": "today(-7)",
      "maxValueExpression": "today()"
     }
    ],
    "title": "Day to evaluate"
   },
   {
    "name": "page2",
    "elements": [
     {
      "type": "boolean",
      "name": "DidYouWorkWithOtherPeople",
      "title": "Did you work with other people?",
      "isRequired": true
     },
     {
      "type": "boolean",
      "name": "didYouHelpOtherPeople",
      "title": "Did you help other people?",
      "isRequired": true
     },
     {
      "type": "boolean",
      "name": "wasYourWorkInterrupted",
      "title": "Was your work interrupted?",
      "isRequired": true
     },
     {
      "type": "text",
      "name": "canYouGiveMoreInformation",
      "visibleIf": "{wasYourWorkInterrupted} = true",
      "title": "Can you give more information?"
     },
     {
      "type": "boolean",
      "name": "didYouMakeProgressTowardYourGoals",
      "title": "Did you make progress toward your goals?",
      "isRequired": true
     }
    ],
    "title": "Workday"
   },
   {
    "name": "page1",
    "elements": [
     {
      "type": "rating",
      "name": "howWasYourWorkDay",
      "title": "How was your work day?",
      "rateMax": 10
     }
    ],
    "title": "Evaluation"
   }
  ]
 }