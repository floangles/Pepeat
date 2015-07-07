$(document).ready(function() {
      var client = algoliasearch('YMTGI2ZT5B', '98577acf450f00177b39ce9eceb9da36');
      var index = client.initIndex('Recipe');
      var $input = $('input');
      $input.keyup(function() {
        index.search($input.val(), {
          hitsPerPage: 10,
          facets: '*'
        }, searchCallback);
      }).focus();
    });

    function searchCallback(err, content) {
      if (err) {
        console.error(err);
        return;
      }
      var $recipes = $('#recipes');
      $recipes.empty();
      for (var i = 0; i < content.hits.length; i++) {
        $recipes.append('<div class="row">');
          $recipes.append('<div class="col-xs-12 col-sm-6">');
            $recipes.append('<div>' + content.hits[i].name + '</div>');
            $recipes.append('<div>' + content.hits[i].numberpers + '</div>');
            $recipes.append('<div>' + content.hits[i].cooktime + '</div>');
            $recipes.append('<div>' + content.hits[i].preparationtime + '</div>');
            $recipes.append("<a href='/profile/recipes/"+content.hits[i].id +"'>" + "voir la recette" + '</a>');
            $recipes.append('<img src="' + content.hits[i].medium_picture_url + '">');
          $recipes.append('</div>');
        $recipes.append('</div>');
      }
    };


