jQuery ->
  $container = $("[data-bricks]")
  gutter = 20
  min_width = 250
  $container.imagesLoaded ->
    $container.masonry
      itemSelector: ".brick__item"
      gutterWidth: gutter
      isAnimated: true
      columnWidth: (containerWidth) ->
        num_of_boxes = (containerWidth / min_width | 0)
        box_width = (((containerWidth - (num_of_boxes - 1) * gutter) / num_of_boxes) | 0)
        box_width = containerWidth  if containerWidth < min_width
        $(".brick__item").width box_width
        box_width

  if $('#offer-bricks').length > 0
    new AnimOnScroll document.getElementById( 'offer-bricks' ),
      minDuration : 0.4
      maxDuration : 0.7
      viewportFactor : 0.2
