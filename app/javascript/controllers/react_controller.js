import { Controller } from "@hotwired/stimulus"
import React from "react"
import { createRoot } from 'react-dom/client';

import Survey from "../components/Survey"

export default class extends Controller {
  connect() {
    console.log("React controller connected")
    const container = document.getElementById("app");
    createRoot(container).render(<Survey />);
  }
}
