import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings:
    ["Explore voucher for all your needs",
    "Have a great experience on the cheap!"],
    typeSpeed: 50,
    backDelay: 200,
    loop: true
  });
}

export { loadDynamicBannerText };
