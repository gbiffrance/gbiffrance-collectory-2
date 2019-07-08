<g:set var="orgNameLong" value="${grailsApplication.config.skin.benin.orgNameLong}"/>
<g:set var="orgNameShort" value="${grailsApplication.config.skin.benin.orgNameShort}"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="app.version" content="${g.meta(name:'app.version')}"/>
    <meta name="app.build" content="${g.meta(name:'app.build')}"/>
    <g:set var="favicon" value="${grailsApplication.config.skin.benin.favicon}"/>
    <link href="${favicon}" rel="shortcut icon"  type="image/x-icon"/>
    <g:set var="beninBaseURL" value="${grailsApplication.config.headerAndFooter.benin.baseURL}"/>
    <link href="${beninBaseURL}/css/ala-styles.css" rel="stylesheet" type="text/css"/>
    <meta name="description" content="Exploration des jeux de données connectés via le ${orgNameLong}"/>


    <g:set var="fluidLayout" value="${pageProperty(name:'meta.fluidLayout')?:grailsApplication.config.skin?.fluidLayout}"/>
    <meta name="breadcrumb" content="${pageProperty(name: 'meta.breadcrumb', default: pageProperty(name: 'title').split('\\|')[0].decodeHTML())}"/>
    <meta name="breadcrumbParent" content="${pageProperty(name: 'meta.breadcrumbParent', default: "${createLink(action: 'map', controller: 'public')},${message(code: 'breadcrumb.collections')}")}"/>

    <title>${pageProperty(name: 'title').split('\\|')[0].decodeHTML()} | Atlas of Living Benin</title>

    <r:script type="text/javascript" disposition="head">
          var COLLECTORY_CONF = {
            contextPath: "${request.contextPath}",
            locale: "${request.locale}",
            cartodbPattern: "${grailsApplication.config.cartodb.pattern}"
          };

          // Init plugins
          jQuery(function(){
              $('.helphover').popover({animation: true, trigger:'hover'});
          });

            $(function(){
                $("#header").load("${beninBaseURL}/banner.html");
                $("#footer").load("${beninBaseURL}/footer.html");
            })
    </r:script>


    <link rel="alternate" type="application/rss+xml" title="RSS Feed" href="${g.createLink(uri:"/feed.xml", absolute: true)}" />

    <r:require modules="datasets_benin_css, jquery, jquery-migration, jquery_i18n, bootstrap,  application, collectory" />

    <r:layoutResources/>
    <g:layoutHead/>
</head>

<body class="${pageProperty(name:'body.class')?:'nav-collections'}" id="${pageProperty(name:'body.id')}" onload="${pageProperty(name:'body.onload')}">

    <r:layoutResources/>
    <!-- Header -->
    <div id="header"></div>
    <!-- End Header -->
    <div class="${fluidLayout?'container-fluid':'container'}" id="main-content">
        <section id="breadcrumb">
            <div class="${fluidLayout ? 'container-fluid' : 'container'}">
                <div class="row row-breadcrumb">
                    <nav aria-label="Breadcrumb" role="navigation">
                        <ul class="breadcrumb-list">
                            <li><a href="${grailsApplication.config.gbifbenin.baseURL ?: 'http://www.gbifbenin.org'}">Accueil</a></li>
                            <span class="divider">/</span>
                            %{--<g:if test="${pageProperty(name:'meta.breadcrumbParent')}">--}%
                                %{--<g:set value="${pageProperty(name:'meta.breadcrumbParent').tokenize(',')}" var="parentArray"/>--}%
                                %{--<li><a href="${parentArray[0]}">${parentArray[1]}</a></li>--}%
                                %{--<span class="divider">/</span>--}%
                            %{--</g:if>--}%
                            <li class="active"><g:if test="${pageProperty(name:'meta.breadcrumb')}">${pageProperty(name:'meta.breadcrumb')}</g:if><g:else>${pageProperty(name: 'title').split('\\|')[0].decodeHTML()}</g:else></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </section>
        <g:layoutBody />
    </div><!--/.container-->
    <div id="footer"></div>
</body>
