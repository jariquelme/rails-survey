import { Controller } from "@hotwired/stimulus"
import React from "react"
import { createRoot } from 'react-dom/client';

import SurveyForm from "../components/Survey_Form"

export default class extends Controller {
  connect() {
    const container = document.getElementById("app");
    createRoot(container).render(<SurveyForm />);
  }
}
