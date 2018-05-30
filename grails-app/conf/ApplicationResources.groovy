modules = {
    datasets_css {
        resource url: [dir:'css', file:'datasets.css']
    }
    gbiffrance_collectory_css {
        resource url: [dir:'css', file:'gbiffrance-collectory.css']
    }
    institution_css {
        resource url: [dir:'css', file:'institution.css']
    }
    datasetsBenin {
        dependsOn 'jquery_i18n'
        resource url:[dir:'js', file:'datasetsBenin.js']
    }
}