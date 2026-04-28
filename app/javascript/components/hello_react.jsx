import React from "react";
import { createRoot } from "react-dom/client";

function HelloReact() {
  return (
    <div style={{ padding: "1rem", border: "1px solid #ddd", borderRadius: "8px" }}>
      <h2>Hello from React</h2>
      <p>This little component is mounted inside a Rails view.</p>
    </div>
  );
}

document.addEventListener("turbo:load", () => {
  const el = document.getElementById("hello-react");

  if (el && !el.dataset.reactMounted) {
    createRoot(el).render(<HelloReact />);
    el.dataset.reactMounted = "true";
  }
});