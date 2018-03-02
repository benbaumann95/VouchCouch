var listings_tab = document.getElementById("listings-tab");
listings_tab.addEventListener(("click"), (event) => {
  switch_active_class(listings_tab);
});

var bookings_tab = document.getElementById("bookings-tab");
bookings_tab.addEventListener(("click"), (event) => {
  switch_active_class(bookings_tab);
});

var watching_tab = document.getElementById("watching-tab");
watching_tab.addEventListener(("click"), (event) => {
  switch_active_class(watching_tab);
});

var following_tab = document.getElementById("following-tab");
following_tab.addEventListener(("click"), (event) => {
  switch_active_class(following_tab);
});

const switch_active_class = (tab) => {
  var current_active_class = document.querySelector('.active');
  current_active_class.classList.remove('active');
  tab.classList.add('active');
};
