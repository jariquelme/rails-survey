import React from "react";
import { useCallback } from 'react';

import 'survey-core/defaultV2.min.css';

import { Model } from 'survey-core';
import { Survey } from 'survey-react-ui';
import { surveyJson } from "./surveyJson"

function SurveyForm() {
  const survey = new Model(surveyJson);
  
  const saveResults = useCallback((sender) => {
    const results = sender.data;
    console.log(results);
  }, []);

  survey.onComplete.add(saveResults);

  return (
    <Survey model={survey} />
  )
}

export default SurveyForm;