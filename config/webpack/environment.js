const { environment } = require('@rails/webpacker')

const webpack = require('webpack')
environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery/src/jquery',
        jQuery: 'jquery/src/jquery',
        Popper: 'popper.js/dist/popper'
    })
)

environment.plugins.prepend('Turbolinks', new webpack.ProvidePlugin({
    Turbolinks: 'turbolinks'
}));

module.exports = environment
