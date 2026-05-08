import React from "react";
import { createRoot } from "react-dom/client";

function Footer({ name, host, versions }) {
  const copyright_year = new Date().getFullYear();

  return (
    <>
      <div>
        © <span>{copyright_year}</span> {name} • Hosted on {host}
      </div>
      <div><br /></div>
      <div>
        Ruby: <span>{versions.Ruby}</span> • Rails:{" "}
        <span>{versions.Rails}</span> • App:{" "}
        <span>{versions.App}</span>
      </div>
    </>
  )
}

document.addEventListener("turbo:load", () => {
  const el = document.getElementById("react-footer");
  const data = document.getElementById("footer-data");

  if (el || !el.dataset.reactMounted) {
    createRoot(el).render(
      <Footer
        name={data.dataset.name}
        host={data.dataset.host}
        versions={{
          Ruby: data.dataset.ruby,
          Rails: data.dataset.rails,
          App: data.dataset.app,
        }}
      />
    );

    el.dataset.reactMounted = "true";
  }
});
