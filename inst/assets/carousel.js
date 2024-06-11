$(() => {
  $("body").on("slide.bs.carousel", ".bsutils-carousel", (event) => {
    $(event.target).trigger("shown");
  });
});
