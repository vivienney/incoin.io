$(document).ready ->
  $("#main").append "<div class='angled-border bottom'></div>"
  $("#ready-for").append "<div class='angled-border top'></div>"


  resizeBorder()

  $(window).resize ->
    resizeBorder()

  # Show and hide employee and employer section on the feature page
  # Show employer container
  $('#employer-tab').on "click", ->
    $('#employee-tab').removeClass("active")
    $('.employee-description').removeClass("active")
    $('#employer-tab').addClass("active")
    $('.employers-description').addClass("active")

  # Show employee container
  $('#employee-tab').on "click", ->
    $('#employer-tab').removeClass("active")
    $('.employers-description').removeClass("active")
    $('#employee-tab').addClass("active")
    $('.employee-description').addClass("active")

  updateSlider = (value)->
    employees = value
    total = 25 + (employees * 4)
    $('.slider-container .employees').text(employees)
    $('.slider-container .total').text(total)
    if value == 1
      return $('.pluralize').text('employee')
    $('.pluralize').text('employees')

  $('#slider').slider
    range: "min"
    value: 3
    min: 1
    max: 100

    slide: (e, o) ->
      updateSlider(o.value)
    create: (e, o) ->
      updateSlider(3)
    stop: (e, o) ->
      updateSlider(o.value)


# If 1 show employee instead of employees

  # Append div to the slider handle
  $('.ui-slider-handle').append(
    """
      <div class="price-calc">
        <p class="base">base price</p>
        <p>+ <span class="employees">3</span> <span class="pluralize">employees</span></p>
        <p><span class="dollar">$</span> <span class="total">37</span></p>
      </div>
    """)

  # Waypoints for the navbar=
  $('#all-of-the').waypoint
    handler: ->
      $('.navbar').toggleClass('scrolled')
    offset: '25%'

  $('#slider-section').waypoint
    handler: ->
      $('.navbar').toggleClass('scrolled')
    offset: '25%'

  $('#simplicity-and-cost').waypoint
    handler: ->
      $('.navbar').toggleClass('scrolled')
    offset: '25%'

  $('#envelope').waypoint
    handler: ->
      $('.navbar').toggleClass('scrolled')
    offset: '25%'

# Since borders don't allow width in percentage we have to calculate it
resizeBorder = ->
  $('.angled-border.bottom').css('border-left-width', "#{$(window).width()}px")
  $('.angled-border.top').css('border-right-width', "#{$(window).width()}px")

