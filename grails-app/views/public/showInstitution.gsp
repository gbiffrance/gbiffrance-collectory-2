<%--
  Created by IntelliJ IDEA.
  User: marie-eliselecoq
  Date: 5/16/18
  Time: 4:25 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" import="au.org.ala.collectory.DataResource; au.org.ala.collectory.Institution" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title><cl:pageTitle><g:fieldValue bean="${instance}" field="name"/></cl:pageTitle></title>
    <script type="text/javascript" language="javascript" src="https://www.google.com/jsapi"></script>
    <g:if test="${instance.publishingCountry == 'BJ'}">
        <meta name="layout" content="${grailsApplication.config.skin.benin.layout}"/>
        <r:require modules="institution_benin, jquery, fancybox, jquery_jsonp, charts_plugin"/>
    </g:if>
    <g:elseif test ="${instance.publishingCountry == 'FR'}">
        <meta name="layout" content="${grailsApplication.config.skin.layout}"/>
        <r:require modules="institution_css, jquery, fancybox, jquery_jsonp, charts_plugin"/>
    </g:elseif>
    <r:script type="text/javascript">
      biocacheServicesUrl = "${grailsApplication.config.biocacheServicesUrl}";
      biocacheWebappBeninUrl = "${grailsApplication.config.biocacheUiBeninURL}"
      biocacheWebappUrl = "${grailsApplication.config.biocacheUiURL}";
      loadLoggerStats = ${!grailsApplication.config.disableLoggerLinks.toBoolean()};
      $(document).ready(function () {
        $("a#lsid").fancybox({
            'hideOnContentClick': false,
            'titleShow': false,
            'autoDimensions': false,
            'width': 600,
            'height': 180
        });
        $("a.current").fancybox({
            'hideOnContentClick': false,
            'titleShow': false,
            'titlePosition': 'inside',
            'autoDimensions': true,
            'width': 300
        });
        $('#overviewTabs a:first').tab('show');
      });
    </r:script>
</head>

<body>
<div id="content">
    <cl:h1 value="${instance.name}"/>
    <div class="row">
            <div class="col-md-8">
                <g:set var="parents" value="${instance.listParents()}"/>
                <g:each var="p" in="${parents}">
                    <h2><g:link action="show" id="${p.uid}">${p.name}</g:link></h2>
                </g:each>
                <cl:valueOrOtherwise value="${instance.acronym}"><span
                        class="acronym"><g:message code="public.show.header.acronym"/>: ${fieldValue(bean: instance, field: "acronym")}</span></cl:valueOrOtherwise>
                <g:if test="${instance.guid?.startsWith('urn:lsid:')}">
                    <span class="lsid"><a href="#lsidText" id="lsid" class="local"
                                          title="Life Science Identifier (pop-up)"><g:message code="public.lsid" /></a></span>

                    <div style="display:none; text-align: left;">
                        <div id="lsidText" style="text-align: left;">
                            <b><a class="external_icon" href="https://wayback.archive.org/web/20100515104710/http://lsids.sourceforge.net:80/"
                                  target="_blank"><g:message code="public.lsidtext.link" />:</a></b>
                            <p><cl:guid target="_blank" guid='${fieldValue(bean: instance, field: "guid")}'/></p>
                            <p><g:message code="public.lsidtext.des" />.</p>
                        </div>
                    </div>
                </g:if>
            </div>
            <div class="col-md-4">
                <div id="dataAccessWrapper" style="display:none;">
                    <g:render template="/plugins/collectory-1.9.2-SNAPSHOT/grails-app/views/public/dataAccess" model="[instance:instance]"/>
                </div>
            </div>
    </div>
    <section id="row">
        <div class="tabbable tabbable-dataresource">
            <ul class="nav nav-tabs" id="overviewTabs">
                <li><a id="tab1" href="#overviewTab" data-toggle="tab"><g:message code="public.show.overviewtabs.overview" /></a></li>
                <li><a id="tab2" href="#resourceTab" data-toggle="tab"><g:message code="public.des" /></a></li>
                <li><a id="tab3" href="#statTab" data-toggle="tab"><g:message code="map.js.records" /></a></li>
                %{--<li id="imagesTabEl" style="display:none;"><a id="tab3" href="#imagesTab" data-toggle="tab"><g:message code="public.show.overviewtabs.images" /></a></li>--}%
            </ul>
        </div>
        <div class="tab-content">
            <div id="overviewTab"  class="tab-pane active row">
                <div class="col-md-8">
                    <g:if test="${instance.pubDescription}">
                        <h2><g:message code="public.des" /></h2>
                        <cl:formattedText>${fieldValue(bean: instance, field: "pubDescription")}</cl:formattedText>
                        <cl:formattedText>${fieldValue(bean: instance, field: "techDescription")}</cl:formattedText>
                    </g:if>
                    <g:if test="${instance.focus}">
                        <h2><g:message code="public.si.content.label02" /></h2>
                        <cl:formattedText>${fieldValue(bean: instance, field: "focus")}</cl:formattedText>
                    </g:if>
                </div>
                <div class="col-md-4">
                        <g:if test="${fieldValue(bean: instance, field: 'logoRef') && fieldValue(bean: instance, field: 'logoRef.file')}">
                            <section class="public-metadata">
                                <img class="institutionImage"
                                     src='${resource(absolute: "true", dir: "data/institution/", file: fieldValue(bean: instance, field: 'logoRef.file'))}'/>
                            </section>
                        </g:if>

                        <g:if test="${fieldValue(bean: instance, field: 'imageRef') && fieldValue(bean: instance, field: 'imageRef.file')}">
                            <section class="public-metadata">
                                <img alt="${fieldValue(bean: instance, field: "imageRef.file")}"
                                     src="${resource(absolute: "true", dir: "data/institution/", file: instance.imageRef.file)}"/>
                                <cl:formattedText
                                        pClass="caption">${fieldValue(bean: instance, field: "imageRef.caption")}</cl:formattedText>
                                <cl:valueOrOtherwise value="${instance.imageRef?.attribution}"><p
                                        class="caption">${fieldValue(bean: instance, field: "imageRef.attribution")}</p></cl:valueOrOtherwise>
                                <cl:valueOrOtherwise value="${instance.imageRef?.copyright}"><p
                                        class="caption">${fieldValue(bean: instance, field: "imageRef.copyright")}</p></cl:valueOrOtherwise>
                            </section>
                        </g:if>
                        <section class="public-metadata">
                            <h4><g:message code="public.location" /></h4>
                            <g:if test="${instance.address != null && !instance.address.isEmpty()}">
                                <p>
                                    <cl:valueOrOtherwise
                                            value="${instance.address?.street}">${instance.address?.street}<br/></cl:valueOrOtherwise>
                                    <cl:valueOrOtherwise
                                            value="${instance.address?.city}">${instance.address?.city}<br/></cl:valueOrOtherwise>
                                    <cl:valueOrOtherwise
                                            value="${instance.address?.state}">${instance.address?.state}</cl:valueOrOtherwise>
                                    <cl:valueOrOtherwise
                                            value="${instance.address?.postcode}">${instance.address?.postcode}<br/></cl:valueOrOtherwise>
                                    <cl:valueOrOtherwise
                                            value="${instance.address?.country}">${instance.address?.country}<br/></cl:valueOrOtherwise>
                                </p>
                            </g:if>
                            <g:if test="${instance.email}"><cl:emailLink>${fieldValue(bean: instance, field: "email")}</cl:emailLink><br/></g:if>
                            <cl:ifNotBlank value='${fieldValue(bean: instance, field: "phone")}'/>
                        </section>

                <!-- contacts -->
                    <g:render template="/plugins/collectory-1.9.2-SNAPSHOT/grails-app/views/public/contacts" bean="${instance.getPublicContactsPrimaryFirst()}"/>

                <!-- web site -->
                        <g:if test="${instance.websiteUrl}">
                            <section class="public-metadata">
                                <h4><g:message code="public.website" /></h4>

                                <div class="webSite">
                                    <a class='external' target="_blank"
                                       href="${instance.websiteUrl}"><g:message code="public.si.website.link01" /> <cl:institutionType
                                            inst="${instance}"/><g:message code="public.si.website.link02" /></a>
                                </div>
                            </section>
                        </g:if>
                <!-- external identifiers -->
                    <g:render template="/plugins/collectory-1.9.2-SNAPSHOT/grails-app/views/public/externalIdentifiers" model="[instance:instance]"/>

                </div>
            </div>
            <div id="resourceTab" class="tab-pane row">
                <h2 class="admin-h2"><g:message code="admin.sr.title05" /></h2>
                <ol>
                    <g:each var="dr" in="${instance.listDataResource().sort{it.name}}">
                        <li><g:link controller="public" action="show"
                                    id="${dr.uid}">${dr?.name}</g:link> <br /><p class="desc-coll">${dr?.makeAbstract(400)}</p> </li>
                    </g:each>
                </ol>
                <div id='usage-stats'>
                    <h2><g:message code="public.usagestats.label" /></h2>

                    <div id='usage'>
                        <p><g:message code="public.usage.des" />...</p>
                    </div>
                </div>
                <h2><g:message code="public.si.content.label04" /></h2>

                <div>
                    <p style="padding-bottom:8px;"><span id="numBiocacheRecords"><g:message code="public.numbrs.des01" /></span> <g:message code="public.numbrs.des02" />.</p>
                    <p><cl:recordsLink entity="${instance}"><g:message code="public.numbrs.link" /> ${instance.name}.</cl:recordsLink></p>
                </div>
            </div>
            <div id="statTab" class="tab-pane row">
                <div id="recordsBreakdown" class="section vertical-charts">
                    <div id="charts"></div>
                </div>

                <cl:lastUpdated date="${instance.lastUpdated}"/>
            </div>
        </div>
    </section>












    </div>
</div><!--close content-->

<g:render template="/plugins/collectory-1.9.2-SNAPSHOT/grails-app/views/public/charts" model="[facet:'institution_uid', instance: instance]" />
</body>
</html>
