var client = algoliasearch(ApplicationID, Search-Only-API-Key);
var index = client.initIndex('#algolia');
index.search('something', function(success, hits) {
  console.log(success, hits)
}, { hitsPerPage: 10, page: 0 });
