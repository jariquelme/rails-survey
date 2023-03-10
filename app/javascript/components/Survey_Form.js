import React from "react";
import { useCallback } from 'react';

import 'survey-core/defaultV2.min.css';

import { Model } from 'survey-core';
import { Survey } from 'survey-react-ui';
import { surveyJson } from "./surveyJson"

function SurveyForm() {
  const survey = new Model(surveyJson);

  const saveResults = useCallback((sender) => {
    const url = "/api/v1/survey_response/create";

    const body = {
      survey_response: {
        response: sender.data
      }
    };
    console.log(body);

    fetch(url, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(body),
    })
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        alert(`status: ${response.status}, error: ${response.statusText}`)
      })
      .then((response) => console.log(response))
      .catch((error) => console.log(error.message));
  }, []);

  survey.onComplete.add(saveResults);

  return (
    <Survey model={survey} />
  )
}

export default SurveyForm;