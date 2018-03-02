// let search_vouchers = (keyword) => {
//   var client = algoliasearch('34J3CD22N1', 'ca9e10bfd44297d9587713230d4798f6');
//   var index = client.initIndex('Voucher');
//   index.search(keyword, { hitsPerPage: 10, page: 0 })
//     .then(function searchDone(content) {
//       console.log(content);
//     })
//     .catch(function searchFailure(err) {
//       console.error(err);
//     });
// }

// var search_button = document.getElementById("search-button");
// var search_bar = document.getElementById("query");
// search_button.addEventListener("click", search_vouchers(search_bar.value));

// // console.log(results)
