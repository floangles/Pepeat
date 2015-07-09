function initAlgolia() {
  var client = algoliasearch('YMTGI2ZT5B', '98577acf450f00177b39ce9eceb9da36');
  var index = client.initIndex('Recipe');
  var $input = $('input');
  $input.keyup(function() {
    index.search($input.val(), {
      hitsPerPage: 10,
      facets: '*'
    }, searchCallback);
  }).focus();
}

function searchCallback(err, content) {
  if (err) {
    console.error(err);
    return;
  }
  var $recipes = $('#recipes');
  $recipes.empty();
      for (var i = 0; i < content.hits.length; i++) {
        $recipe = $('<div class="col-xs-12 col-sm-4 ">');
          $card =$('<div class="card-algolia">')
            $header =$("<div class='marginhead'>")
              $header.append('<img src="' + content.hits[i].medium_picture_url +'"'+' class="img-size"'+ '>');
                $component1 =$("<div class='numbpers'>")
                  $component1.append(content.hits[i].numberpers);
                  $component1.append('x parts');

                $component2 =$("<div class='cooktime'>")
                  $component2.append('<i class="fa fa-clock-o"></i> ' + content.hits[i].cooktime);

                $component3=$("<div class='titlerecipe'>")
                  $component3.append('<p class="text-left">' + content.hits[i].name + '</p>');
            $description =$("<div>")
                $coco =$("<div class='text-center'>")
                  $coco.append("<a href='/profile/recipes/"+content.hits[i].id +"'"+">" + "Voir la recette  <i class='fa fa-eye'></i>" + '</a>');
                  $coco.append('<hr>');
        $recipes.append($recipe)
        $recipe.append($card)
        $card.append($header)
        $card.append($description)
        $header.append($component1)
        $header.append($component2)
        $header.append($component3)
        $description.append($coco)
      }
};
