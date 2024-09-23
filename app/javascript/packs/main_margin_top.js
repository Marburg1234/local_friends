document.addEventListener("turbolinks:load", function() {
  adjustHeaderMargin();
});

document.addEventListener("ajax:success", function() {
  adjustHeaderMargin();
});

function adjustHeaderMargin() {
  const header = document.querySelector('header');
  if (header) {
    const headerHeight = header.offsetHeight;
    document.documentElement.style.setProperty('--header-height', headerHeight + 'px');
  }
}