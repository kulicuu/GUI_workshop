
#eventually will factor out for inheritance but someone said something 
# about premature optimisations so for now there's no optimisations for space


# for this one i actually want to run some kind of controlled recursion.
# so there will be four smaller keys here.  if we could reuse some components that would be nice.
module.exports = ->
    c = -> console.log.apply console, arguments
    React = require("react")
    {p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, ul, li, ol, code, a, input} = React.DOM
    rr = -> React.createFactory(React.createClass.apply(React, arguments))

    rr
        getInitialState: ->
            position: @props.initial_position or {x: 0, y: 0}
            background: 'url(/static_assets/blue_snow.png)'
            backgroundSize: '100% 100%'
            filter: 'drop-shadow(1px 1px 2px red)'
            

        mouseOver: (e) ->
            @setState
               #background: @props.testing
                #backgroundSize: ''
                filter: 'opacity(40%) saturate(30%) drop-shadow(10px 10px 20px blue)'
        mouseOut: (e) ->
            @setState
                #backgroundSize: '100% 100%'
                #background: 'url(/adom.jpg)'
                filter: ''

        render_room: ->
            if @props.room_id is 4
                React.render rooms[@props.room_id](), document.body


        onClick: (e) ->
            @setState
                filter: 'opacity(80%) saturate(30%) drop-shadow(10px 10px 20px blue)'
            setTimeout =>
                @setState
                    filter: 'drop-shadow(10px 10px 20px red)'
                @render_room()
            , 400

        render: ->
            div
                onClick: @onClick
                onMouseOver: @mouseOver
                onMouseOut: @mouseOut
                onMouseLeave: @mouseOut
                style:

                    # position: 'absolute'
                    top: @state.position.y
                    left: @state.position.x

                    cursor: 'pointer'
                    borderRadius: 400
                    background: @state.background
                    backgroundSize: @state.backgroundSize
                    color: 'white'
                    height: '100%'
                    width: '100%'
                    #filter: 'opacity(40%) saturate(30%) drop-shadow(10px 10px 20px blue)'
                    filter: @state.filter
                ,
                # p
                #     style:
                #         color: 'white'
                #         position: 'relative'
                #         top: '40%'
                #         left: '30%'
                #     ,
                #     "room_key"