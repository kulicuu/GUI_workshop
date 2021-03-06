
{c, React, rr, shortid, assign, update, __react__root__} = require('../__boiler__plate__.coffee')()
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath} = React.DOM

abs_pos = (a) ->
    position: 'absolute'
    width: a.w or 100
    height: a.h or 100
    top: a.t or ''
    left: a.l or ''
    bottom: a.b or ''
    right: a.r or ''
    zIndex: 500

style_alpha_position = (a) ->
    color: 'white'

progress_bar_0 = rr
    #mixins: [PureRenderMixin]
    componentDidMount: ->
        if @props.auto_showoff is on
            dir_up = on
            inc = 4
            setInterval =>
                if dir_up is on and @state.range < 100
                    @setState
                        range: @state.range += inc
                else if @state.range >= 100
                    dir_up = off
                    @setState
                        range: 100 - inc
                else if dir_up is off and @state.range > 0
                    @setState
                        range: @state.range -= inc
                else if @state.range <= 0
                    dir_up = on
                    @setState
                        range: inc
            , 20

    lowerRange: (e) ->
        if @state.range isnt 0
            @setState
                range: parseInt(@state.range) - 1

    raiseRange: (e) ->
        if @state.range isnt 100
            @setState
                range: parseInt(@state.range) + 1

    rangeChange: (e) ->
        @setState
            range: e.currentTarget.value

    getInitialState: ->
        whatever: 'yes'
        color_a: 'lightgreen'
        range: 100
    render: ->
        clipId = shortid.generate()
        clipId2 = shortid.generate()
        style = (a) ->
            position: 'absolute'

            #width: 600
            #height: 500
            #background: 'lightgrey'
            #border: '3px solid white'

            #top: 20
            #left: 20
        height = @props.height
        width = @props.width
        if (width / 100) >= 2 then padX = (width / 100) else padX = 2
        if (height / 100) >= 2 then padY = (height / 100) else padY = 2

        div # container
            style: style()
            ,
            div
                style:
                    position: 'absolute'
                    left: width + 10
                    top: 0
                    background: 'lightgrey'
                    border: '1px solid white'
                    borderRadius: 4
                ,
                span
                    onClick: @lowerRange
                    style:
                        zIndex: 700000
                        cursor: 'pointer'
                        #position: 'absolute'
                        background: 'lightgrey'
                        border: '1px solid white'
                        padding: 4
                        borderRadius: 10
                        #left: 680
                    ,
                    "<-"
                input
                    type: 'range'
                    onChange: @rangeChange
                    value: @state.range
                    step: 1
                    style:
                        #position: 'absolute'
                        #left: @props.width + 300

                        width: 200
                    ,
                span
                    onClick: @raiseRange
                    style:
                        cursor: 'pointer'
                        #position: 'absolute'
                        background: 'lightgrey'
                        border: '1px solid white'
                        padding: 4
                        borderRadius: 10
                        #left: 930
                    ,
                    "->"
                span
                    style:
                        #position: 'absolute'
                        #left: 600
                        #top: 100
                        fontSize: 23
                        color: 'white'
                    ,
                    @state.range + "%"
            svg
                width: @props.width + padX
                height: @props.height + padY
                style:
                    #background: 'lightgrey'
                    position: 'absolute'
                ,
                defs
                    clipPath
                        id: clipId
                        ,
                        rect
                            x: 0
                            y: 0
                            width: ((width + padX)/ 100) * @state.range
                            height: height + 10 # fix this
                rect
                    x: (height / 2) + (padX / 2)
                    y: padY / 2
                    width: width - height
                    height: height
                    style:
                        fill: @props.backFill or 'red'
                circle #left circle bound ; could make an ellipse for other styles
                    cx: (height / 2) + (padX / 2)
                    cy: (height / 2) + (padY / 2)
                    r: (height / 2)
                    fill: @props.backFill or 'black'
                circle # right circle bound
                    cx: width - (height / 2) + (padX / 2)
                    cy: (height / 2) + (padY / 2)
                    r: height / 2
                    fill: @props.backFill or 'black'
                rect
                    x: (height / 2) + padX
                    y: 0
                    width: width - height
                    height: height + padY
                    clipPath: "url(##{clipId})"
                    style:
                        fill: @props.progressFill or 'lightgreen'
                circle
                    cx: (height / 2) + (padX / 2)
                    cy: (height / 2) + (padY / 2)
                    r: (height / 2) + (padY / 2)
                    clipPath: "url(##{clipId})"
                    fill: @props.progressFill or 'lightgreen'
                circle
                    cx: width - (height / 2) + (padX / 2)
                    cy: (height / 2) + (padY / 2)
                    r: (height / 2) + (padY / 2)
                    clipPath: "url(##{clipId})"
                    fill: @props.progressFill or 'lightgreen'

module.exports = -> progress_bar_0



