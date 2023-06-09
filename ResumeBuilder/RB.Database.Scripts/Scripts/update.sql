SET IDENTITY_INSERT [RB].[TemplateDetails] ON 

INSERT [RB].[TemplateDetails] ([TemplateId], [TemplateName], [TemplateHtml], [IsActive], [CreateOn], [ModifiedOn], [TemplateImgPath], [ExperienceHtml], [EducationHtml], [SkillsHtml], [HobbyHtml], [LanguageHtml]) VALUES (1, N'Resume 1', N'<div id="printArea">
  <link href=''https://fonts.googleapis.com/css?family=Lato:400,300,700'' rel=''stylesheet'' type=''text/css''>
  <div class="container" style="max-width: 700px;       background: #fff;    margin: 0px auto 0px;     box-shadow: 1px 1px 5px #DAD7D7;    border-radius: 3px;      padding: 40px;    margin-top: 50px;">
    <div class="header" style="margin-bottom: 30px;">
      <div class="full-name" style="font-size: 40px;      text-transform: uppercase;      margin-bottom: 5px;">
        <span class="first-name" style="font-weight: 700;">
          <$FIRSTNAME$>
        </span>
        <span class="last-name" style="font-weight: 300;">
          <$LASTNAME$>
        </span>
      </div>
      <div class="contact-info" style="margin-bottom: 20px;">
        <span class="email" style="color: #999;      font-weight: 300;">Email: </span>
        <span class="email-val">
          <$EMAIL$>
        </span>
        <span class="separator" style="height: 10px;      display: inline-block;      border-left: 2px solid #999;      margin: 0px 10px;"></span>
        <span class="phone" style="color: #999;      font-weight: 300;">Phone: </span>
        <span class="phone-val">
          <$PHONENUMBER$>
        </span>
      </div>
      <div class="about">
        <span class="position" style="font-weight: bold;      display: inline-block;      margin-right: 10px;      text-decoration: underline;">
          <$JOBTITLE$>
        </span>
        <span class="desc">
          <$SUMMARY$>
        </span>
      </div>
    </div>
    <div class="details" style="line-height: 20px;">
      <div class="section" style="margin-bottom: 40px;">
        <div class="section__title" style="letter-spacing: 2px;      color: #54AFE4;      font-weight: bold;      margin-bottom: 10px;      text-transform: uppercase; <$ISDISPLAYEXP$>">Experience </div>
        <$ExperienceHtml$>
      </div>
      <div class="section">
        <div class="section__title" style="letter-spacing: 2px;      color: #54AFE4;      font-weight: bold;      margin-bottom: 10px;      text-transform: uppercase; <$ISDISPLAYEDU$>">Education </div>
        <$EducationHtml$>
      </div>
      <div class="section">
        <div class="section__title" style="letter-spacing: 2px;      color: #54AFE4;      font-weight: bold;      margin-bottom: 10px;      text-transform: uppercase; <$ISDISPLAYSKILLS$>">Skills </div>
        <$SkillsHtml$>
      </div>
      <div class="section" style=" margin-bottom: 0px;">
        <div class="section__title" style="letter-spacing: 2px;margin-bottom: 0;      color: #54AFE4;      font-weight: bold;      margin-bottom: 10px;      text-transform: uppercase; <$ISDISPLAYHOBBY$>"> INTERESTS </div>
        <$HobbyHtml$>
      </div>
      <div class="section">
        <div class="section__title" style="letter-spacing: 2px;      color: #54AFE4;      font-weight: bold;      margin-bottom: 10px;      text-transform: uppercase; <$ISDISPLAYSKILLS$>">Languages </div>
        <$LanguageHtml$>
      </div>
    </div>
  </div>
</div>', 1, CAST(N'2023-03-11T22:02:07.707' AS DateTime), NULL, N'/dist/img/Templates/Resume1.png', N'<div class="section__list">
        <div class="section__list-item" style="margin-bottom: 40px;">
  <div class="left" style=" vertical-align: top;      display: inline-block;width: 60%;">
    <div class="name" style="font-weight: bold;"><$ExpEmployer$></div>
    <div class="addr"><$ExpCity$></div>
    <div class="duration"><$ExpStartDate$> - <$ExpEndDate$></div>
  </div>
  <div class="right" style="vertical-align: top;      display: inline-block;tex-align: right;      width: 39%;">
    <div class="name" style="font-weight: bold;"><$ExpJobTitle$></div>
    <div class="desc"><$ExpJobDesc$></div>
  </div>
</div>
      </div>', N'<div class="section__list">
       <div class="section__list-item" style="margin-bottom: 40px;">
  <div class="left" style=" vertical-align: top;      display: inline-block;width: 60%;">
    <div class="name" style="font-weight: bold;">
      <$EduSchool$>
    </div>
    <div class="addr">
      <$EduCity$>
    </div>
    <div class="duration">
      <$EduStartDate$> - <$EduEndDate$>
    </div>
  </div>
  <div class="right" style="vertical-align: top;      display: inline-block;tex-align: right;      width: 39%;">
    <div class="name" style="font-weight: bold;">
      <$Education$>
    </div>
  </div>
</div>
      </div>', N' <div class="skills">
        <div class="skills__item" style="margin-bottom: 10px;">
          <div class="left" style=" vertical-align: top;      display: inline-block;width: 60%;">
            <div class="name" style="font-weight: bold;"><$SkillName$></div>
          </div>
        </div>
      </div>', N'<div class="skills">
        <div class="skills__item" style="margin-bottom: 10px;">
          <div class="left" style=" vertical-align: top;      display: inline-block;width: 60%;">
            <div class="name" style="font-weight: bold;"><$HobbyName$></div>
          </div>
        </div>
      </div>', N'<div class="skills">         <div class="skills__item" style="margin-bottom: 10px;">           <div class="left" style=" vertical-align: top;      display: inline-block;width: 60%;">             <div class="name" style="font-weight: bold;"><$LangName$></div>           </div>         </div>       </div>')
INSERT [RB].[TemplateDetails] ([TemplateId], [TemplateName], [TemplateHtml], [IsActive], [CreateOn], [ModifiedOn], [TemplateImgPath], [ExperienceHtml], [EducationHtml], [SkillsHtml], [HobbyHtml], [LanguageHtml]) VALUES (2, N'Resume 2', N'<div >    <div class="container" id="printArea" style="max-width: 700px;       background: #fff;    margin: 0px auto 0px;     box-shadow: 1px 1px 2px #DAD7D7;    border-radius: 3px;      padding: 40px;    margin-top: 50px;">      <div>        <div class=""  tabindex="0">          <div>            <style type="text/css" id="static">              @font-face {                font-family: ''Century Gothic'';                font-weight: normal;                font-style: normal;                src: local(''Century Gothic''), url(''/blobcontent/zty/fonts/CenturyGothic.ttf'') format(''truetype'')              }                @font-face {                font-family: ''Century Gothic'';                font-weight: bold;                font-style: normal;                src: local(''Century Gothic Bold''), url(''/blobcontent/zty/fonts/CenturyGothicBold.ttf'') format(''truetype'')              }                @font-face {                font-family: ''Century Gothic'';                font-weight: bold;                font-style: italic;                src: local(''Century Gothic Bold Italic''), url(''/blobcontent/zty/fonts/CenturyGothicBoldItalic.ttf'') format(''truetype'')              }                @font-face {                font-family: ''Century Gothic'';                font-weight: normal;                font-style: italic;                src: local(''Century Gothic Italic''), url(''/blobcontent/zty/fonts/CenturyGothicItalic.ttf'') format(''truetype'')              }                html,              body,              div,              span,              applet,              object,              iframe,              h1,              h2,              h3,              h4,              h5,              h6,              p,              blockquote,              pre,              a,              abbr,              acronym,              address,              big,              cite,              code,              del,              dfn,              em,              font,              img,              ins,              kbd,              q,              s,              samp,              small,              strike,              strong,              sub,              sup,              tt,              var,              b,              u,              i,              center,              dl,              dt,              dd,              ol,              ul,              li,              fieldset,              form,              label,              legend,              table,              caption,              tbody,              tfoot,              thead,              tr,              th,              td {                margin: 0;                padding: 0;                border: 0;                outline: 0;                vertical-align: baseline;                background: transparent              }                body {                text-align: left;                font-feature-settings: "liga"0;                -moz-font-feature-settings: "liga"off              }                .skn-srz1 ol,              .skn-srz1 ul {                list-style: none              }                .skn-srz1 table {                border-collapse: collapse;                border-spacing: 0;                font-size: inherit;                color: inherit;                width: 100%              }                /*START content disc style for LI*/              .skn-srz1 ul,              .skn-srz1 li {                margin: 0;                padding: 0;                list-style-type: disc              }                .skn-srz1 ul li {                margin: 0 0 0 16px;                padding: 0              }                @-moz-document url-prefix() {                .skn-srz1 ul li {                  margin: 0 0 0 12px;                  padding: 0 0 0 3px                }              }                /*END content disc style for LI*/              /*common css*/              .skn-srz1 .txtBold {                font-weight: 700              }                .skn-srz1 .paddedline {                display: block              }                .skn-srz1 .mt5 {                margin-top: 5px              }                .skn-srz1 .txtRight {                text-align: right              }                .skn-srz1 table.skills,              .skn-srz1 .table_wrapper {                margin-top: 0;                width: 100%;                word-break: break-all              }                .skn-srz1 table.skills th,              .skn-srz1 table.skills td {                text-align: center;                width: 20%              }                .skn-srz1 table.skills .skillname,              .skn-srz1 table.skills .skillrating {                text-align: left;                width: 35%              }                .skn-srz1 table.skills .skillrating {                width: 20%              }                .skn-srz1 table.skills .skillyears,              .skn-srz1 table.skills .skilllast {                width: 19%              }                .skn-srz1 table.skills .pad1 {                width: 5%              }                .skn-srz1 table.skills .pad2,              .skn-srz1 table.skills .pad3 {                width: 1%              }                .skn-srz1 {                color: #343434;                font-variant-ligatures: none;                line-height: 16px;                min-height: 792px;                box-sizing: border-box              }                .skn-srz1 .name {                font-weight: 700;                padding: 0;                position: relative;                text-align: left;                word-wrap: break-word              }                .skn-srz1 .address .singlecolumn {                margin-left: 0 !important              }                .skn-srz1 .heading {                font-weight: 700;                line-height: 15px;                margin-bottom: 10px              }                .skn-srz1 .sectiontitle {                word-break: break-word              }                .skn-srz1 .degreeGap {                margin-bottom: 4px              }                .skn-srz1 .locationGap {                margin-top: 4px              }                .skn-srz1 .firstsection,              .skn-srz1 .SECTION_NAME {                padding-top: 0 !important              }                .skn-srz1 .section:empty,              .skn-srz1 .hide-bar .outer-square,              .skn-srz1 .hide-bar .field-ratt {                display: none              }                /*Left Box */              .skn-srz1 .left-box {                background: #003D73;                display: table-cell;                padding: 15px;                box-sizing: initial              }                .skn-srz1 .left-box .section {                position: relative;                color: #fff              }                .skn-srz1 .left-box .heading {                line-height: 1.5;                margin-left: -15px;                margin-right: -15px;                padding: 0 15px;                position: relative              }                .skn-srz1 .left-box .heading:before {                content: '';  position: absolute;                left: 0;                top: 0;                background: #003D73;                height: 100%;                width: 100%;                filter: brightness(0.8)              }                .skn-srz1 .left-box .sectiontitle {                padding: 3px 0;                text-align: left;                position: relative              }                .skn-srz1 .left-box .SECTION_CNTC {                padding-top: 20px !important              }                .skn-srz1 .parentContainer {                border-collapse: collapse;                display: table;                min-height: inherit;                table-layout: fixed;                width: 100%              }                /*Right Box */              .skn-srz1 .right-box {                display: table-cell;                letter-spacing: .2px;                padding: 15px;                vertical-align: top              }                .skn-srz1 .right-box .section:first-child {                padding-top: 0              }                .skn-srz1 .right-box .heading {                border-bottom: 1px solid #d5d6d6;                border-top: 1px solid #d5d6d6;                letter-spacing: 0;                padding: 5px 0              }                .skn-srz1 .right-box .sectiontitle {                color: #002e58              }                .skn-srz1 .right-box .paddedline.date-content {                position: absolute;                margin-left: 0;                width: 65px              }                .skn-srz1 .paragraph .singlecolumn {                position: relative              }                .skn-srz1 .right-box .summary .paragraph .singlecolumn {                margin-left: 0              }                .skn-srz1 .education .joblocation,              .txtItl {                font-style: italic              }                /* Issues fix for builder page */              .skn-srz1>div {                min-height: inherit              }                #displayResume .skn-srz1.document {                min-height: 792px              }                .skn-srz1 .left-box .active * {                color: #343434              }                /* Only for firefox */              @-moz-document url-prefix() {                .skn-srz1 .parentContainer {                  height: 1px                }              }                .skn-srz1 .word-break {                word-wrap: break-word              }                .skn-srz1 .left-box .outer-square,              .skn-srz1 right-box .outer-square,              .skn-srz1 .left-box .inner-square,              .skn-srz1 .right-box .inner-square {                height: 7px;                position: relative              }                .skn-srz1 .left-box .inner-square {                background: #fff              }                .skn-srz1 .right-box .outer-square {                background: #d6d6d6              }                .skn-srz1 .right-box .inner-square {                background: #003D73;                filter: brightness(.8)              }                /* For dates fix */              .skn-srz1 .right-box .hidedates {                visibility: hidden;                position: static !important;                display: block;                float: left              }                .skn-srz1 .left-box .hidedates {                display: none              }                .skn-srz1 .paragraph.datespara:after {                content: '';  display: table;                clear: both              }                /*PICT*/              .skn-srz1 .prflPic,              .skn-srz1 .prflPic>div {                width: 154px;                height: 154px              }                .skn-srz1 .prflPic img {                min-width: 100%;                max-width: 100%;                min-height: 100%;                max-height: 100%              }            </style>            <style type="text/css" id="dynamic" data-time="Sun Mar 26 2023 10:49:10 GMT+0530 (India Standard Time)">              .skn-srz1,              .skn-srz1 table {                line-height: 18px              }                .skn-srz1.fontface {                font-family: Century Gothic              }                .skn-srz1.fontsize {                font-size: 11px              }                .skn-srz1 .section {                padding-top: 20px              }                .skn-srz1 .firstparagraph {                margin-top: 0 !important              }                .skn-srz1 .paragraph {                margin-top: 10px              }                .skn-srz1 .singlecolumn,              .skn-srz1 .maincolumn {                word-wrap: break-word              }                .skn-srz1 .right-box .singlecolumn,              .skn-srz1 .right-box .maincolumn {                margin-left: 0px              }                .skn-srz1 table.skills td {                padding-top: 5px              }                .skn-srz1 .jobtitle,              .skn-srz1 .degree,              .skn-srz1 .programline {                font-size: 14px              }                .skn-srz1 .name {                font-size: 28px;                line-height: 34px              }                .skn-srz1 .heading {                line-height: 22px              }                .skn-srz1 .sectiontitle {                font-size: 16px              }                .skn-srz1 .resumeTitle {                font-size: 14px;                padding-top: 3px              }                /*Left Box*/              .skn-srz1 .left-box {                background: #003D73;                width: 154px              }                .skn-srz1 .left-box .section {                padding-top: 20px              }                .skn-srz1 .left-box .heading {                line-height: 22px              }                .skn-srz1 .left-box .heading:before {                background: #003D73              }                .skn-srz1 .left-box .outer-square:before {                background: #003D73;                content: '';  position: absolute;                height: 7px;                width: 100%;                filter: brightness(.8)              }                /*Right Box*/              .skn-srz1 .right-box .paragraph .singlecolumn {                margin-left: 91px              }                .skn-srz1 .right-box .paddedline.date-content {                left: -91px              }                .skn-srz1 .right-box .sectiontitle {                color: #003D73              }                .skn-srz1 .right-box .inner-square {                background: #003D73              }                /* Issues fix for builder page */              .skn-srz1 .right-box .sortable-item {                padding-top: 20px              }                .skn-srz1 .left-box>.sortable-item.active>.wrapper .heading:before {                background: none              }                .skn-srz1 .left-box .sortable-item.active .outer-square:before {                background: #d6d6d6              }                .skn-srz1 .left-box .sortable-item.active .inner-square {                background: #003D73              }                /* Issues fix for builder page: Phase 2 */              .skn-srz1._single-parent-drag>.wrapper-bg+div {                position: relative;                z-index: 8              }                .skn-srz1._single-parent-drag .outer-square:before {                background: #d6d6d6;                content: '';  position: absolute;                height: 7px;                width: 100%;                filter: brightness(0.8)              }                .skn-srz1._single-parent-drag .inner-square {                background: #003D73              }                .skn-srz1._single-parent-drag .wrapper-bg+div .paragraph {                margin-top: 0              }                .skn-srz1 .outer-square,              .skn-srz1 .inner-square {                height: 7px;                position: relative              }                .skn-srz1 .parent-drag.active .wrapper,              .skn-srz1 .sortable-item .sectiontitle {                position: relative              }                .resume-preview .skn-srz1 .parentContainer .right-box .sortable-item:first-child,              .resume-preview .skn-srz1 .parentContainer .right-box .sortable-item:first-child .section,              .modal-preview-resume .skn-srz1 .parentContainer .right-box .sortable-item:first-child,              .modal-preview-resume .skn-srz1 .parentContainer .right-box .sortable-item:first-child .section {                padding-top: 0              }                /* support for IE Browser */              @media screen and (min-width:0\0) {                .skn-srz1 .left-box {                  box-sizing: content-box                }                  .skn-srz1 .parentContainer {                  display: flex                }                  .skn-srz1 .right-box {                  width: calc(100% - 154px)                }                  .skn-srz1 .left-box,                .skn-srz1 .right-box {                  background: none;                  display: inline;                  position: relative                }                  .skn-srz1 .left-box:before {                  content: '';  background: #003D73;                  position: absolute;                  left: 0;                  top: 0;                  height: 100%;                  width: 100%;                  opacity: .9                }              }            </style>          </div>          <div class="document doc-root fontsize fontface vmargins hmargins   pagesize skn-srz1 SRZ1  ZTY ">            <div id="CONTAINER_PARENT_0" class="parentContainer">              <div id="CONTAINER_0" class="left-box">                <div data-react-beautiful-dnd-draggable="59" class="sortable-item section-container SortableItem-sibling  data-PICT">                  <div class="document-tool sec-tool" id="editIcons" style="right: -22px;"></div>                  <div id="SECTION_PICT8b5f790d-efca-89d8-81ee-286b0d7cee2a" class="section photo notdraggable SECTION_PICT firstsection noparagraph  " data-section-cd="PICT">                    <div class=" doc-item">                      <div class="">                        <div class="">                          <div id="PARAGRAPH_PICT_0" class="paragraph PARAGRAPH_PICT firstparagraph placeholder-text ">                            <div class="clearfix doc-item">                              <div class="clear"></div>                            </div>                          </div>                        </div>                      </div>                    </div>                  </div>                </div>                <div data-react-beautiful-dnd-draggable="59" class="sortable-item section-container SortableItem-sibling  data-NAME">                  <div class="document-tool sec-tool" id="editIcons" style="right: -22px;"></div>                  <div id="SECTION_NAMEdd726a98-8ce4-4a84-abe9-71d42ddfc5f2" class="section SECTION_NAME notdraggable    " data-section-cd="NAME">                    <div class=" doc-item">                      <div class="">                        <div class="">                          <div id="PARAGRAPH_NAME_ab68583e-bfbc-4374-a66d-1249fef4ecb4" class="paragraph PARAGRAPH_NAME firstparagraph  ">                            <div>                              <div class="name word-break">                                <span id="FIELD_FNAM">                                  <$FIRSTNAME$>                                </span>                                <span class="word-break" id="FIELD_LNAM">                                  <$LASTNAME$>                                </span>                              </div>                              <div class="resumeTitle placeholder-text" id="FIELD_DCTL">                                <$JOBTITLE$>                              </div>                            </div>                          </div>                        </div>                      </div>                    </div>                  </div>                </div>                <div data-react-beautiful-dnd-draggable="59" class="sortable-item section-container SortableItem-sibling  data-CNTC">                  <div class="document-tool sec-tool" id="editIcons" style="right: -22px;"></div>                  <div id="SECTION_CNTC5fda833b-2fa2-44a0-8c80-7c60c9172adc" class="section SECTION_CNTC notdraggable    has-title " data-section-cd="CNTC">                    <div class=" doc-item">                      <div class="heading">                        <div class="sectiontitle" id="SECTIONNAME_CNTC">Contact <span title="Rename Contact section" class="rename-section text-rename"></span>                        </div>                      </div>                      <div class="">                        <div class="">                          <div id="PARAGRAPH_CNTC_13fd78c2-6900-43e9-a822-cbcbe0ec0d0e" class="paragraph PARAGRAPH_CNTC firstparagraph  ">                            <div class="clearfix doc-item">                              <div class="address">                                <div class="singlecolumn">                                  <div dependency="STRT|CITY|STAT|ZIPC|ADDR">                                    <div class="txtBold">                                      <span class="xslt_static_change">Address </span>                                    </div>                                    <div id="FIELD_STRT"></div>                                    <span id="FIELD_CITY"></span>                                    <span id="FIELD_STAT"></span>                                    <span id="FIELD_ZIPC"></span>                                    <span id="FIELD_ADDR">                                      <$ADDRESS$>                                    </span>                                  </div>                                  <div class="txtBold mt5" dependency="HPHN|CPHN">                                    <span class="xslt_static_change">Phone </span>                                  </div>                                  <div dependency="HPHN">                                    <span id="FIELD_HPHN">                                      <$PHONENUMBER$>                                    </span>                                  </div>                                  <div class="txtBold mt5" dependency="EMAI">                                    <span class="xslt_static_change">E-mail </span>                                  </div>                                  <div dependency="EMAI" class="word-break">                                    <span id="FIELD_EMAI">                                      <$EMAIL$>                                    </span>                                  </div>                                </div>                              </div>                            </div>                          </div>                        </div>                      </div>                    </div>                  </div>                </div>                <div data-react-beautiful-dnd-draggable="59" class="sortable-item section-container SortableItem-sibling  data-HILT" style="<$ISDISPLAYSKILLS$>">                  <div class="document-tool sec-tool" id="editIcons" style="right: -22px;"></div>                  <div id="SECTION_HILT2728952d-30a4-407c-a234-a1cf13b47029" class="section SECTION_HILT  noparagraph  has-title " data-section-cd="HILT">                    <div class=" doc-item" style="<$ISDISPLAYSKILLS$>">                      <div class="heading">                        <div class="sectiontitle" id="SECTIONNAME_HILT">Skills <span title="Rename Skills section" class="rename-section text-rename"></span>                        </div>                      </div>                      <$SkillsHtml$>                    </div>                  </div>                </div>              </div>              <div id="CONTAINER_1" class="right-box">                <div data-react-beautiful-dnd-draggable="59" class="sortable-item section-container SortableItem-sibling  data-SUMM">                  <div class="document-tool sec-tool" id="editIcons" style="right: -22px;"></div>                  <div id="SECTION_SUMMbb0e4c57-65b0-47e5-b219-9fefa09f24b3" class="section summary notdraggable SECTION_SUMM  noparagraph  " data-section-cd="SUMM">                    <div class=" doc-item">                      <div class="">                        <div class="">                          <div id="PARAGRAPH_SUMM_0" class="paragraph PARAGRAPH_SUMM firstparagraph placeholder-text " style="      font-size: 14px;">                            <div class="clearfix doc-item">                              <div class="singlecolumn" id="FIELD_FRFM">                                <$SUMMARY$>                              </div>                            </div>                          </div>                        </div>                      </div>                    </div>                  </div>                </div>                <div data-react-beautiful-dnd-draggable="59" class="sortable-item section-container SortableItem-sibling  data-EXPR" style="<$ISDISPLAYEXP$>">                  <div class="document-tool sec-tool" id="editIcons" style="right: -22px;"></div>                  <div id="SECTION_EXPR5608f65f-6e6c-418c-8bb7-8e9973c7de87" class="section experience SECTION_EXPR  noparagraph multi-para has-title " data-section-cd="EXPR">                    <div class=" doc-item">                      <div class="heading">                        <div class="sectiontitle" id="SECTIONNAME_EXPR">Work History <span title="Rename Work History section" class="rename-section text-rename"></span>                        </div>                      </div>                      <$ExperienceHtml$>                    </div>                  </div>                </div>                <div data-react-beautiful-dnd-draggable="59" class="sortable-item section-container SortableItem-sibling  data-EDUC" style="<$ISDISPLAYEDU$>">                  <div class="document-tool sec-tool" id="editIcons" style="right: -22px;"></div>                  <div id="SECTION_EDUCb4a7a80a-6296-4cd8-a2b2-bcb48bcfe003" class="section education SECTION_EDUC  noparagraph multi-para has-title " data-section-cd="EDUC">                    <div class=" doc-item">                      <div class="heading">                        <div class="sectiontitle" id="SECTIONNAME_EDUC">Education <span title="Rename Education section" class="rename-section text-rename"></span>                        </div>                      </div>                      <$EducationHtml$>                    </div>                  </div>                </div>              </div>            </div>          </div>          <div></div>        </div>      </div>      <div></div>    </div>    </div>', 0, CAST(N'2023-03-11T22:02:07.707' AS DateTime), NULL, N'/dist/img/Templates/Resume2.png', N'<div class="">
  <div class="sortableInner">
    <div id="PARAGRAPH_EXPR_0" class="paragraph datespara PARAGRAPH_EXPR firstparagraph placeholder-text ">
      <div class="clearfix doc-item">
       
        <div class="singlecolumn">
          <div class="paddedline date-content" dependency="JSTD|EDDT" style="font-size:14px">
            <span class="jobdates" id="FIELD_JSTD" format="%Y-%m">
              <$ExpStartDate$>
            </span>
            <span dependency="JSTD+EDDT"> - </span>
            <span class="jobdates" id="FIELD_EDDT" format="%Y-%m">
              <$ExpEndDate$>
            </span>
            <br dependency="JTIT|COMP|JSTA|JCIT">
          </div>
          <span class="paddedline" dependency="JTIT">
            <span class="jobtitle txtBold" id="FIELD_JTIT">
              <$ExpJobTitle$>
            </span>
          </span>
          <span style="font-size:14px" class="paddedline locationGap txtItl" dependency="COMP|JSTA|JCIT">
            <span class="companyname" id="FIELD_COMP">
              <$ExpEmployer$>
            </span>
            <span dependency="COMP+JCIT|JSTA">,</span>
            <span class="jobcity" id="FIELD_JCIT">
              <$ExpCity$>
            </span>
            <span class="jobstate" id="FIELD_JSTA"></span>
          </span>
          <span class="jobline" id="FIELD_JDES">
            <ul style="font-size:14px">
              <li>
                <$ExpJobDesc$>
              </li>
            </ul>
          </span>
        </div>
      </div>
    </div>
  </div>
</div>', N'<div class="">
   <div class="">
     <div id="PARAGRAPH_EDUC_0" class="paragraph datespara PARAGRAPH_EDUC firstparagraph placeholder-text ">
       <div class="clearfix doc-item">
         <div class="singlecolumn">
           <div class="paddedline date-content">
             <span class="jobdates" id="FIELD_GRST" format="%Y-%m"></span>
             <span class="jobdates" id="FIELD_GRED" format="%Y-%m"></span>
           </div>
           <span class="paddedline degreeGap txtBold" dependency="DGRE|STUY">
             <span class="degree" id="FIELD_DGRE">
               <$Education$>
             </span>
             <span class="programline" id="FIELD_STUY"></span>
           </span>
           <div style="font-size:14px" class="paddedline txtItl" dependency="SCIT|SSTA|SCHO">
             <span class="companyname" id="FIELD_SCHO"><$EduSchool$></span>
             <span dependency="SCHO+SSTA|SCIT"> - </span>
             <span class="joblocation jobcity" id="FIELD_SCIT"><$EduCity$></span>
           </div>
           <span id="FIELD_FRFM"></span>
         </div>
       </div>
     </div>
   </div>
 </div>', N'<div class="">
  <div class="">
    <div id="PARAGRAPH_HILT_0" class="paragraph PARAGRAPH_HILT firstparagraph placeholder-text ">
      <div class="clearfix doc-item">
        <div class="singlecolumn maincolumn">
          <span class="paddedline" id="FIELD_SKC1">
            <ul>
              <li><$SkillName$></li>
            </ul>
          </span>
          <span class="paddedline txtRight" id="FIELD_RATT"></span>
        </div>
      </div>
    </div>
  </div>
</div>', NULL, N'<div class="">   <div class="">     <div id="PARAGRAPH_HILT_0" class="paragraph PARAGRAPH_HILT firstparagraph placeholder-text ">       <div class="clearfix doc-item">         <div class="singlecolumn maincolumn">           <span class="paddedline" id="FIELD_SKC1">             <ul>               <li><$LangName$></li>             </ul>           </span>           <span class="paddedline txtRight" id="FIELD_RATT"></span>         </div>       </div>     </div>   </div> </div>')
INSERT [RB].[TemplateDetails] ([TemplateId], [TemplateName], [TemplateHtml], [IsActive], [CreateOn], [ModifiedOn], [TemplateImgPath], [ExperienceHtml], [EducationHtml], [SkillsHtml], [HobbyHtml], [LanguageHtml]) VALUES (1002, N'Resume 3', N'<div class="container" style="max-width: 700px;       background: #fff;    margin: 0px auto 0px;     box-shadow: 1px 1px 2px #DAD7D7;    border-radius: 3px;      padding: 40px;    margin-top: 50px;">
  <div c>
    <div class="" tabindex="0">
      <div>
        <style type="text/css" id="static">
          /*Font support for MAC*/
          @font-face {
            font-family: ''Century Gothic'';
            font-weight: normal;
            font-style: normal;
            src: local(''Century Gothic''), url(''/blobcontent/zty/fonts/CenturyGothic.ttf'') format(''truetype'')
          }

          @font-face {
            font-family: ''Century Gothic'';
            font-weight: bold;
            font-style: normal;
            src: local(''Century Gothic Bold''), url(''/blobcontent/zty/fonts/CenturyGothicBold.ttf'') format(''truetype'')
          }

          @font-face {
            font-family: ''Century Gothic'';
            font-weight: bold;
            font-style: italic;
            src: local(''Century Gothic Bold Italic''), url(''/blobcontent/zty/fonts/CenturyGothicBoldItalic.ttf'') format(''truetype'')
          }

          @font-face {
            font-family: ''Century Gothic'';
            font-weight: normal;
            font-style: italic;
            src: local(''Century Gothic Italic''), url(''/blobcontent/zty/fonts/CenturyGothicItalic.ttf'') format(''truetype'')
          }

          html,
          body,
          div,
          span,
          applet,
          object,
          iframe,
          h1,
          h2,
          h3,
          h4,
          h5,
          h6,
          p,
          blockquote,
          pre,
          a,
          abbr,
          acronym,
          address,
          big,
          cite,
          code,
          del,
          dfn,
          em,
          font,
          img,
          ins,
          kbd,
          q,
          s,
          samp,
          small,
          strike,
          strong,
          sub,
          sup,
          tt,
          var,
          b,
          u,
          i,
          center,
          dl,
          dt,
          dd,
          ol,
          ul,
          li,
          fieldset,
          form,
          label,
          legend,
          table,
          caption,
          tbody,
          tfoot,
          thead,
          tr,
          th,
          td {
            margin: 0;
            padding: 0;
            border: 0;
            outline: 0;
            vertical-align: baseline;
            background: transparent
          }

          body {
            text-align: left;
            font-feature-settings: "liga"0;
            -moz-font-feature-settings: "liga"off
          }

          .skn-srz5 ol,
          .skn-srz5 ul {
            list-style: none
          }

          .skn-srz5 table {
            border-collapse: collapse;
            border-spacing: 0;
            font-size: inherit;
            color: inherit;
            width: 100%
          }

          /*START content disc style for LI*/
          .skn-srz5 ul,
          .skn-srz5 li {
            margin: 0;
            padding: 0;
            list-style-type: disc
          }

          .skn-srz5 ul li {
            margin: 0 0 0 16px;
            padding: 0
          }

          @-moz-document url-prefix() {
            .skn-srz5 ul li {
              margin: 0 0 0 12px;
              padding: 0 0 0 3px
            }
          }

          /*END content disc style for LI*/
          .skn-srz5 span.paddedline {
            display: block
          }

          .skn-srz5 span.jobtitle,
          .skn-srz5 span.degree,
          .skn-srz5 span.programline {
            font-weight: bold
          }

          .skn-srz5 .pb5 {
            padding-bottom: 5px
          }

          .skn-srz5 span.dates_wrapper {
            font-weight: bold;
            display: block;
            float: left;
            text-align: left;
            padding-right: 10px;
            box-sizing: border-box
          }

          .skn-srz5 .txtItalics {
            font-style: italic
          }

          .skn-srz5 .txtBold {
            font-weight: bold
          }

          /*table style*/
          .skn-srz5 table.skills,
          .table_wrapper {
            width: 100%;
            margin-top: 0;
            word-wrap: break-word
          }

          .skn-srz5 table.skills th,
          table.skills td {
            width: 20%;
            text-align: center
          }

          .skn-srz5 table.skills .skillname,
          .skn-srz5 table.skills .skillrating {
            text-align: left;
            width: 35%
          }

          .skn-srz5 table.skills .skillrating {
            width: 20%
          }

          .skn-srz5 table.skills .skillyears,
          .skn-srz5 table.skills .skilllast {
            width: 19%
          }

          .skn-srz5 table.skills .pad1 {
            width: 5%
          }

          .skn-srz5 .skills .pad2,
          .skn-srz5 table.skills .pad3 {
            width: 1%
          }

          /*document*/
          .skn-srz5 {
            box-sizing: border-box;
            color: #343434;
            font-variant-ligatures: none;
            line-height: 16px;
            padding-bottom: 24px;
            min-height: 792px;
            position: relative;
            word-wrap: break-word
          }

          .skn-srz5 .topbgborder {
            bottom: -6px;
            height: 14px;
            left: 16px;
            position: absolute;
            width: 26px
          }

          .skn-srz5 .nameSec {
            padding-top: 24px !important
          }

          .skn-srz5 .nameSec .paragraph,
          .skn-srz5 .cntcSec .paragraph,
          .skn-srz5 .summary .paragraph {
            padding: 0
          }

          .skn-srz5 .name {
            color: #fff;
            font-weight: 700;
            text-align: left;
            word-wrap: break-word
          }

          .skn-srz5 .address {
            color: #fff;
            text-align: left;
            font-size: 0.917em;
            line-height: 1.25em;
            margin-top: 0;
            white-space: nowrap;
            position: relative;
            z-index: 2
          }

          .skn-srz5 .address .txtBold {
            margin-right: 3px
          }

          .skn-srz5 .addressLeft,
          .skn-srz5 .addressRight {
            width: 49%;
            padding: 0 1% 0 0;
            white-space: normal;
            display: inline-block;
            vertical-align: top
          }

          .skn-srz5 .addressRight {
            padding: 0 0 0 1%
          }

          .skn-srz5 .sectiontitle {
            word-wrap: break-word
          }

          .skn-srz5 .degreeGap {
            margin-bottom: 4px
          }

          .skn-srz5 .locationGap {
            margin-top: 4px
          }

          .skn-srz5 .firstsection,
          .skn-srz5 .nameSec,
          .skn-srz5 .cntcSec {
            padding-top: 0 !important
          }

          .skn-srz5 .education .joblocation {
            font-style: italic
          }

          .skn-srz5 .resumeTitle {
            text-align: left;
            color: #fff !important;
            z-index: 2;
            position: relative;
            font-weight: 400
          }

          /*leftBox and rightBox css*/
          .skn-srz5 .left-box .sectiontitle {
            text-align: left
          }

          /* fixes for grey border */
          .skn-srz5 .left-box .section {
            position: relative
          }

          .skn-srz5 .right-box {
            display: table-cell;
            letter-spacing: .2px;
            vertical-align: top;
          }

          .skn-srz5 .right-box .section {
            border-left: 1px solid #d5d6d6;
            padding-left: 23px;
            position: relative
          }

          .skn-srz5 .right-box .section:first-child {
            padding-top: 0
          }

          .skn-srz5 .parentContainer .section {
            border-left: 1px solid #d7d7d7;
            padding-left: 24px;
            padding-right: 24px;
            margin-left: 12px;
            position: relative
          }

          .skn-srz5 .parentContainer .summary {
            padding-left: 0;
            padding-right: 0;
            border: none
          }

          .skn-srz5 .heading {
            clear: both;
            color: #373d48;
            font-weight: bold
          }

          /*topsection css*/
          .skn-srz5 .topsection {
            background: #373d48;
            display: flex;
            flex-wrap: wrap
          }

          .skn-srz5 .left-box,
          .skn-srz5 .right-box {
            display: table-cell;
            padding-top: 24px;
            padding-bottom: 15px
          }

          .skn-srz5 .left-box {
            box-sizing: initial;
            display: table-cell;
            position: relative;
            width: 100%
          }

          .skn-srz5 .left-box {
            width: 70%;
            flex-grow: 1
          }

          .skn-srz5 .right-box {
            padding-left: 0
          }

          .skn-srz5 .right-box .section {
            border: 0;
            padding-left: 0
          }

          .skn-srz5 .right-box .section .icon-heading,
          .skn-srz5 .right-box .section:first-child .icon-heading {
            height: 25px;
            left: -8px;
            position: absolute;
            top: 3px;
            width: 25px;
            z-index: 10
          }

          /*.skn-srz5 .icon1{opacity:.75}*/
          .skn-srz5 .right-box .section .icon-heading {
            top: 23px
          }

          .skn-srz5 .right-box .paddedline.date-content {
            position: absolute;
            font-weight: 700;
            margin-left: 0;
            width: 65px
          }

          .skn-srz5 .paragraph {
            position: relative;
            clear: both
          }

          .skn-srz5 .paragraph .singlecolumn {
            position: relative
          }

          .skn-srz5 .section:empty,
          .skn-srz5 .hide-bar .ratingRect .noLnht,
          .skn-srz5 .hide-bar .field-ratt {
            display: none
          }

          .skn-srz5 .right-box .education .paragraph,
          .skn-srz5 .right-box .experience .paragraph,
          .skn-srz5 .right-box .summary .paragraph {
            margin-left: 0
          }

          .skn-srz5 .right-box .summary .singlecolumn {
            margin-left: 0 !important
          }

          /*Timeline classes*/
          .skn-srz5 .summary {
            border: none;
            margin-left: 0;
            padding-left: 0;
            padding-top: 20px !important
          }

          .skn-srz5 .firstsection,
          .skn-srz5 .cntcSec {
            border: none
          }

          .skn-srz5 .firstsection {
            padding-bottom: 0
          }

          .skn-srz5 .heading,
          .skn-srz5 .singlecolumn {
            position: relative
          }

          .skn-srz5 .singlecolumn:before {
            display: block;
            position: absolute;
            top: 0;
            left: -30px;
            content: "";
            height: 9px;
            width: 9px;
            border: 0;
            background: #373d48;
            z-index: 2;
            transform: rotate(45deg)
          }

          .skn-srz5 .summary .singlecolumn:before {
            display: none
          }

          .skn-srz5 .section.notdraggable+.section:not(.notdraggable):before {
            border: 3px solid #fff;
            content: '''';
            position: absolute;
            top: 0;
            left: -2px
          }

          .skn-srz5 .paragraph+tr.paragraph:before {
            display: none
          }

          .skn-srz5 .notdraggable {
            border: 0
          }

          /*Icon*/
          .skn-srz5 .headingIcon {
            left: -45px;
            top: -7px;
            position: absolute
          }

          .skn-srz5 .headingIcon svg {
            height: 40px;
            width: 40px;
            position: relative
          }

          .skn-srz5 .headingIcon svg rect {
            transform: rotate(45deg);
            fill: #373d48
          }

          .skn-srz5 .headingIcon svg path {
            fill: #fff
          }

          .skn-srz5 .ratingRect {
            float: right;
            text-align: right
          }

          .skn-srz5 .ratingRect .noLnht {
            line-height: 0
          }

          .skn-srz5 .ratingRect svg rect {
            transform: rotate(45deg)
          }

          .skn-srz5 .ratingfield p {
            display: inline
          }

          /*common css*/
          .skn-srz5 .txtBold {
            font-weight: bold
          }

          .skn-srz5 .txtItl {
            font-style: italic
          }

          .skn-srz5 .paddedline {
            display: block
          }

          .skn-srz5 .pt5 {
            padding-top: 5px
          }

          .skn-srz5 .word-break {
            word-wrap: break-word
          }

          .skn-srz5 .noPind {
            margin-left: 0 !important
          }

          /* Issues fix for builder page */
          #displayResume .skn-srz5.document {
            min-height: 792px
          }

          /* finalize page Timeline */
          .skn-srz5>div:not(.topsection),
          .skn-srz5>div:not(.parentContainer) {
            min-height: auto
          }

          .skn-srz5 .rating .default-fill {
            fill: #003d73
          }

          .skn-srz5 .sortable-item .rating-wrapper {
            display: block
          }

          /*.skn-srz5 .sortable-item .rating-wrapper > div{display:flex;position:relative;white-space:nowrap}*/
          /*PICT*/
          .skn-srz5 .prflPic,
          .skn-srz5 .prflPic>div {
            float: right;
            width: 124px;
            height: 124px
          }

          .skn-srz5 .prflPic img {
            min-width: 100%;
            max-width: 100%;
            min-height: 100%;
            max-height: 100%
          }
        </style>
        <style type="text/css" id="dynamic" data-time="Sun Mar 26 2023 10:52:02 GMT+0530 (India Standard Time)">
          .skn-srz5,
          .skn-srz5 table {
            line-height: 16px
          }

          .skn-srz5.fontface {
            font-family: Century Gothic
          }

          .skn-srz5.fontsize {
            font-size: 11px
          }

          .skn-srz5 .topsection {
            background: #576d7b
          }

          .skn-srz5 .section {
            padding-top: 20px
          }

          .skn-srz5 .heading {
            padding-bottom: 10px;
            color: #576d7b
          }

          .skn-srz5 .jobtitle,
          span.degree,
          span.programline {
            font-size: 17px
          }

          .skn-srz5 .paragraph {
            padding-top: 10px
          }

          .skn-srz5 .firstparagraph {
            padding-top: 10px;
          }

          .skn-srz5 .photo .paragraph {
            padding-top: 0
          }

          .skn-srz5 .firstparagraph .singlecolumn.maincolumn,
          .skn-srz5 .singlecolumn.paragraphindent {
            margin-left: 0
          }

          .skn-srz5 .singlecolumn,
          .skn-srz5 .maincolumn {
            margin-left: 70px
          }

          .skn-srz5 span.dates_wrapper {
            width: 70px;
            font-size: 15px;
            line-height: 17px
          }

          .skn-srz5 .sectiontitle,
          .skn-srz5 .resumeTitle {
            font-size: 16px;
            line-height: 21px
          }

          .skn-srz5 table.skills td {
            padding-top: 5px
          }

          .skn-srz5 .name {
            font-size: 36px;
            line-height: 46px
          }

          .skn-srz5 .sectiontitle {
            font-size: 18px;
          }

          .skn-srz5 .right-box .paragraph .singlecolumn {
            margin-left: {
              $PMAR
            }

            px
          }

          .skn-srz5 .right-box .paddedline.date-content {
            left:- {
              $PMAR
            }

            px
          }

          .skn-srz5 .rating-wrapper {
            margin-top: 5px
          }

          .skn-srz5 .rating-wrapper * {
            font-size: 20px
          }

          .skn-srz5 .sectiontitle,
          .skn-srz5 .resumeTitle {
            font-size: 18px;
            line-height: 21px
          }

          .skn-srz5 .parentContainer,
          .skn-srz5 .topsection {
            padding-left: 24px;
            padding-right: 24px
          }

          .skn-srz5 .parentContainer svg.rating {
            padding-top: {
              $RAPT
            }

            px
          }

          .skn-srz5 .address {
            font-size: 16px;
            line-height: 21px;
            padding-top: 10px
          }

          /*Timeline*/
          .skn-srz5 .section.notdraggable+.section:not(.notdraggable):before {
            height: 30px
          }

          .skn-srz5 .singlecolumn:before {
            background: #576d7b;
            top: 4px
          }

          .skn-srz5 .paragraph .dates_wrapper+.singlecolumn:before {
            left: -100px
          }

          /*Icon*/
          .skn-srz5 .headingIcon svg rect {
            fill: #576d7b
          }

          .skn-srz5 .headingIcon {
            top: -8px
          }
        </style>
      </div>
      <div class="document doc-root fontsize fontface vmargins hmargins   pagesize skn-srz5 SRZ5  ZTY ">
        <div id="CONTAINER_PARENT_0" class="topsection">
          <div id="CONTAINER_0" class="left-box">
            <div data-react-beautiful-dnd-draggable="94" class="sortable-item section-container SortableItem-sibling name-contact ">
              <div class="document-tool sec-tool" id="editIcons" style="right: -22px;"></div>
              <div id="SECTION_NAMEdd726a98-8ce4-4a84-abe9-71d42ddfc5f2" class="section nameSec notdraggable SECTION_NAME    " data-section-cd="NAME">
                <div class=" doc-item">
                  <div class="">
                    <div class="">
                      <div id="PARAGRAPH_NAME_ab68583e-bfbc-4374-a66d-1249fef4ecb4" class="paragraph PARAGRAPH_NAME firstparagraph  ">
                        <div>
                          <div class="name">
                            <span class="field fName" id="FIELD_FNAM">
                              <$FIRSTNAME$>
                            </span>
                            <span dependency="FNAM+LNAM"></span>
                            <span id="FIELD_LNAM">
                              <$LASTNAME$>
                            </span>
                          </div>
                          <div class="resumeTitle placeholder-text" id="FIELD_DCTL">
                            <$JOBTITLE$>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div id="SECTION_CNTC5fda833b-2fa2-44a0-8c80-7c60c9172adc" class="section cntcSec notdraggable SECTION_CNTC    " data-section-cd="CNTC">
                <div class=" doc-item">
                  <div class="">
                    <div class="">
                      <div id="PARAGRAPH_CNTC_13fd78c2-6900-43e9-a822-cbcbe0ec0d0e" class="paragraph PARAGRAPH_CNTC firstparagraph  ">
                        <div class="clearfix doc-item">
                          <div class="address">
                            <div class="addressLeft">
                              <div dependency="STRT|CITY|STAT|ZIPC|ADDR">
                                <span class="txtBold">
                                  <span class="xslt_static_change">Address </span>
                                </span>
                                <span id="FIELD_STRT"></span>
                                <span class="spaced field" id="FIELD_CITY"></span>
                                <span class="spaced field" id="FIELD_STAT"></span>
                                <span class="spaced field" id="FIELD_ZIPC"></span>
                                <span id="FIELD_ADDR">
                                  <$ADDRESS$>
                                </span>
                              </div>
                              <div dependency="HPHN|CPHN">
                                <span class="txtBold">
                                  <span class="xslt_static_change">Phone </span>
                                </span>
                                <span id="FIELD_HPHN" dependency="HPHN">
                                  <$PHONENUMBER$>
                                </span>
                                <span id="FIELD_CPHN"></span>
                              </div>
                              <div dependency="EMAI">
                                <span class="txtBold">
                                  <span class="xslt_static_change">E-mail </span>
                                </span>
                                <span id="FIELD_EMAI">
                                  <$EMAIL$>
                                </span>
                              </div>
                            </div>
                            <div class="addressRight"></div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="doc-overlay section-overlay" style="left:-22px; right: -22px;">
                <span></span>
              </div>
            </div>
          </div>
          <div id="CONTAINER_1" class="right-box">
            <div data-react-beautiful-dnd-draggable="94" class="sortable-item section-container SortableItem-sibling  data-PICT">
              <div class="document-tool sec-tool" id="editIcons" style="right: -22px;"></div>
              <div id="SECTION_PICT8b5f790d-efca-89d8-81ee-286b0d7cee2a" class="section photo notdraggable SECTION_PICT firstsection noparagraph  " data-section-cd="PICT">
                <div class=" doc-item">
                  <div class="">
                    <div class="">
                      <div id="PARAGRAPH_PICT_0" class="paragraph PARAGRAPH_PICT firstparagraph placeholder-text ">
                        <div class="clearfix doc-item">
                          <div class="clear"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div id="CONTAINER_PARENT_1" class="parentContainer">
          <div id="CONTAINER_2">
            <div data-react-beautiful-dnd-draggable="95" class="sortable-item section-container SortableItem-sibling  data-SUMM">
              <div class="document-tool sec-tool" id="editIcons" style="right: -22px;"></div>
              <div id="SECTION_SUMMbb0e4c57-65b0-47e5-b219-9fefa09f24b3" class="section summary notdraggable SECTION_SUMM  noparagraph  " data-section-cd="SUMM">
                <div class=" doc-item">
                  <div class="">
                    <div class="">
                      <div id="PARAGRAPH_SUMM_0" class="paragraph PARAGRAPH_SUMM firstparagraph placeholder-text ">
                        <div class="clearfix doc-item">
                          <div class="field singlecolumn noPind" id="FIELD_FRFM" style="font-size:14px">
                            <$SUMMARY$>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <br />
            <div style="<$ISDISPLAYSKILLS$>" data-react-beautiful-dnd-draggable="95" class="sortable-item section-container SortableItem-sibling  data-HILT">
              <div class="document-tool sec-tool" id="editIcons" style="right: -22px;"></div>
              <div id="SECTION_HILT2728952d-30a4-407c-a234-a1cf13b47029" class="section SECTION_HILT  noparagraph  has-title " data-section-cd="HILT">
                <div class=" doc-item">
                  <div class="heading">
                    <div class="headingIcon">
                      <svg viewBox="0 0 80 80">
                        <rect x="28" y="-28" height="50" width="50"></rect>
                        <path transform="translate(23,19)" d="M31.36 14.293l-3.413-3.413c2.133-.64 3.84-2.773 3.84-5.333C31.787 2.56 29.227 0 26.24 0c-2.347 0-4.48 1.707-5.333 3.84l-3.2-3.2c-.854-.853-2.56-.853-3.414 0L9.6 5.333c-.213.427-.213.854-.213 1.28.213.427.64.64 1.066.427h.64c2.134 0 3.84 1.707 3.84 4.053 0 2.134-1.493 4.054-3.84 4.054-2.133 0-4.053-1.92-4.053-4.054v-.64a1.63 1.63 0 0 0-.427-1.066c-.213-.427-.64-.427-.853 0L.64 14.293c-.853.854-.853 2.347 0 3.414L14.293 31.36c.427.427 1.067.64 1.707.64.64 0 1.28-.213 1.707-.64L31.36 17.707c.853-.854.853-2.56 0-3.414zm-1.493 1.92L16.213 29.867c-.213.213-.426.213-.64 0L2.133 16.213c-.213 0-.213-.426 0-.426l3.414-3.414a5.953 5.953 0 0 0 5.76 4.48c3.2 0 5.76-2.56 5.76-5.973 0-2.773-1.707-5.12-4.267-5.76l2.987-2.987c.213-.213.426-.213.64 0l4.906 4.907c.214.213.854.427 1.067.213.427-.213.64-.64.64-1.066v-.214-.213c0-1.92 1.493-3.413 3.413-3.413 1.92 0 3.414 1.493 3.414 3.413 0 1.92-1.494 3.413-3.414 3.413h-.426c-.427 0-.854.214-1.067.64-.213.427-.213.854.213 1.067l4.694 4.907c.213 0 .213.426 0 .426z"></path>
                      </svg>
                    </div>
                    <div class="sectiontitle" id="SECTIONNAME_HILT">Skills <span title="Rename Skills section" class="rename-section text-rename"></span>
                    </div>
                  </div>
                  <div class="">
                    <div class="">
                      <div id="PARAGRAPH_HILT_0" class="paragraph PARAGRAPH_HILT firstparagraph placeholder-text ">
                        <div class="clearfix doc-item">
                          <div class="singlecolumn maincolumn noPind">
                            <$SkillsHtml$>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div style="<$ISDISPLAYEXP$>" data-react-beautiful-dnd-draggable="95" class="sortable-item section-container SortableItem-sibling  data-EXPR">
              <div class="document-tool sec-tool" id="editIcons" style="right: -22px;"></div>
              <div id="SECTION_EXPR5608f65f-6e6c-418c-8bb7-8e9973c7de87" class="section SECTION_EXPR  noparagraph multi-para has-title " data-section-cd="EXPR">
                <div class=" doc-item">
                  <div class="heading">
                    <div class="headingIcon">
                      <svg viewBox="0 0 80 80">
                        <rect x="28" y="-28" height="50" width="50"></rect>
                        <path transform="translate(23,19)" d="M30 5.983h-7.987V4.045c0-1.655-1.345-3-3-3h-6.015c-1.655 0-3 1.345-3 3v1.938H2.001C.9 5.983 0 6.883 0 7.982V28.953c0 1.1.9 2.001 2 2.001h28c1.099 0 2-.9 2-2V7.981a2.008 2.008 0 0 0-2-1.999zM12 4.045c0-.551.447-1 1-1h6.011c.55 0 1 .447 1 1v1.938H12V4.045zM2 7.982h28v7.008H18.986v-1.025c0-1.101-.897-2-1.998-2h-1.993c-1.101 0-2 .897-2 2v1.025H2V7.982zm14.989 11.02h-1.993v-5.037h1.993v5.037zM2 28.951V16.988h10.997V19c0 1.102.897 2 2 2h1.99a2.002 2.002 0 0 0 2-2v-2.01h11.011v11.963H2.001z"></path>
                      </svg>
                    </div>
                    <div class="sectiontitle" id="SECTIONNAME_EXPR">Work History <span title="Rename Work History section" class="rename-section text-rename"></span>
                    </div>
                  </div>
                  <$ExperienceHtml$>
                </div>
              </div>
            </div>
            <div style="<$ISDISPLAYEDU$>" data-react-beautiful-dnd-draggable="95" class="sortable-item section-container SortableItem-sibling  data-EDUC">
              <div class="document-tool sec-tool" id="editIcons" style="right: -22px;"></div>
              <div id="SECTION_EDUCb4a7a80a-6296-4cd8-a2b2-bcb48bcfe003" class="section SECTION_EDUC  noparagraph multi-para has-title " data-section-cd="EDUC">
                <div class=" doc-item">
                  <div class="heading">
                    <div class="headingIcon">
                      <svg viewBox="0 0 80 80">
                        <rect x="28" y="-28" height="50" width="50"></rect>
                        <path transform="translate(23,19)" d="M30.96 22.58v-9.217l.503-.303c.327-.194.533-.58.537-1 .004-.421-.196-.81-.518-1.014L16.44 1.848a.893.893 0 0 0-.967.004l-14.96 9.21c-.318.202-.515.587-.513 1.005.002.417.203.8.525.998l6.573 3.999a1.256 1.256 0 0 0-.133.56v9.669c0 .325.122.637.335.853.217.22 2.294 2.146 8.646 2.146 6.33 0 8.463-1.82 8.686-2.028a1.21 1.21 0 0 0 .367-.884v-9.917c0-.16-.03-.313-.082-.452l4.044-2.441v8.016c-.593.396-.995 1.124-.995 1.965 0 1.262.895 2.285 2 2.285 1.104 0 1.999-1.023 1.999-2.285 0-.845-.407-1.576-1.005-1.97zM23 26.725c-.787.432-2.866 1.282-7.054 1.282-4.214 0-6.246-.905-6.982-1.34v-8.468l6.493 3.95a.892.892 0 0 0 .937.006L23 18.17v8.556zm-7.06-6.876L3.08 12.045l12.881-7.89 12.922 7.868L15.94 19.85z"></path>
                      </svg>
                    </div>
                    <div class="sectiontitle" id="SECTIONNAME_EDUC">Education <span title="Rename Education section" class="rename-section text-rename"></span>
                    </div>
                  </div>
                  <$EducationHtml$>
                </div>
              </div>
            </div>
            <div style="<$ISDISPLAYHOBBY$>" data-react-beautiful-dnd-draggable="95" class="sortable-item section-container SortableItem-sibling  data-EDUC">
              <div class="document-tool sec-tool" id="editIcons" style="right: -22px;"></div>
              <div id="SECTION_EDUCb4a7a80a-6296-4cd8-a2b2-bcb48bcfe003" class="section SECTION_EDUC  noparagraph multi-para has-title " data-section-cd="EDUC">
                <div class=" doc-item">
                  <div class="heading">
                    <div class="headingIcon">
                      <svg viewBox="0 0 80 80">
                        <rect x="28" y="-28" height="50" width="50"></rect>
                        <path transform="translate(23,19)" d="M30.96 22.58v-9.217l.503-.303c.327-.194.533-.58.537-1 .004-.421-.196-.81-.518-1.014L16.44 1.848a.893.893 0 0 0-.967.004l-14.96 9.21c-.318.202-.515.587-.513 1.005.002.417.203.8.525.998l6.573 3.999a1.256 1.256 0 0 0-.133.56v9.669c0 .325.122.637.335.853.217.22 2.294 2.146 8.646 2.146 6.33 0 8.463-1.82 8.686-2.028a1.21 1.21 0 0 0 .367-.884v-9.917c0-.16-.03-.313-.082-.452l4.044-2.441v8.016c-.593.396-.995 1.124-.995 1.965 0 1.262.895 2.285 2 2.285 1.104 0 1.999-1.023 1.999-2.285 0-.845-.407-1.576-1.005-1.97zM23 26.725c-.787.432-2.866 1.282-7.054 1.282-4.214 0-6.246-.905-6.982-1.34v-8.468l6.493 3.95a.892.892 0 0 0 .937.006L23 18.17v8.556zm-7.06-6.876L3.08 12.045l12.881-7.89 12.922 7.868L15.94 19.85z"></path>
                      </svg>
                    </div>
                    <div class="sectiontitle" id="SECTIONNAME_EDUC">INTERESTS <span title="Rename Education section" class="rename-section text-rename"></span>
                    </div>
                  </div>
                  <$HobbyHtml$>
                </div>
              </div>
            </div>
            <div style="<$ISDISPLAYLANG$>" data-react-beautiful-dnd-draggable="95" class="sortable-item section-container SortableItem-sibling  data-EDUC">
              <div class="document-tool sec-tool" id="editIcons" style="right: -22px;"></div>
              <div id="SECTION_EDUCb4a7a80a-6296-4cd8-a2b2-bcb48bcfe003" class="section SECTION_EDUC  noparagraph multi-para has-title " data-section-cd="EDUC">
                <div class=" doc-item">
                  <div class="heading">
                    <div class="headingIcon">
                      <svg viewBox="0 0 80 80">
                        <rect x="28" y="-28" height="50" width="50"></rect>
                        <path transform="translate(23,19)" d="M30.96 22.58v-9.217l.503-.303c.327-.194.533-.58.537-1 .004-.421-.196-.81-.518-1.014L16.44 1.848a.893.893 0 0 0-.967.004l-14.96 9.21c-.318.202-.515.587-.513 1.005.002.417.203.8.525.998l6.573 3.999a1.256 1.256 0 0 0-.133.56v9.669c0 .325.122.637.335.853.217.22 2.294 2.146 8.646 2.146 6.33 0 8.463-1.82 8.686-2.028a1.21 1.21 0 0 0 .367-.884v-9.917c0-.16-.03-.313-.082-.452l4.044-2.441v8.016c-.593.396-.995 1.124-.995 1.965 0 1.262.895 2.285 2 2.285 1.104 0 1.999-1.023 1.999-2.285 0-.845-.407-1.576-1.005-1.97zM23 26.725c-.787.432-2.866 1.282-7.054 1.282-4.214 0-6.246-.905-6.982-1.34v-8.468l6.493 3.95a.892.892 0 0 0 .937.006L23 18.17v8.556zm-7.06-6.876L3.08 12.045l12.881-7.89 12.922 7.868L15.94 19.85z"></path>
                      </svg>
                    </div>
                    <div class="sectiontitle" id="SECTIONNAME_EDUC">LANGUAGES <span title="Rename Education section" class="rename-section text-rename"></span>
                    </div>
                  </div>
                  <$LanguageHtml$>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div></div>
    </div>
  </div>
  <div class="track-horizontal" style="display: none; visibility: hidden;">
    <div style="position: relative; display: block; height: 100%; cursor: pointer; border-radius: inherit; background-color: rgba(0, 0, 0, 0.2); width: 0px;"></div>
  </div>
</div>', 1, CAST(N'2023-03-11T22:02:07.707' AS DateTime), NULL, N'/dist/img/Templates/Resume3.png', N'<div class="">
  <div class="sortableInner">
    <div id="PARAGRAPH_EXPR_0" class="paragraph PARAGRAPH_EXPR firstparagraph placeholder-text ">
      <div class="clearfix doc-item">
        <span class="dates_wrapper">
          <span class="jobdates" id="FIELD_JSTD" format="%b %Y">
            <$ExpStartDate$>
          </span>
          <span dependency="JSTD+EDDT"> - </span>
          <span class="jobdates" id="FIELD_EDDT" format="%b %Y">
            <$ExpEndDate$>
          </span>
        </span>
        <div class="singlecolumn">
          <span class="paddedline pb5" dependency="JTIT">
            <span class="jobtitle" id="FIELD_JTIT">
              <$ExpJobTitle$>
            </span>
          </span>
          <span style="font-size:14px" class="paddedline txtItalics pb5" dependency="COMP|JSTA|JCIT">
            <span class="companyname" id="FIELD_COMP">
              <$ExpEmployer$>
            </span>
            <span dependency="COMP+JCIT|JSTA">, </span>
            <span class="joblocation jobcity" id="FIELD_JCIT">
              <$ExpCity$>
            </span>
            <span class="joblocation jobstate" id="FIELD_JSTA"></span>
          </span>
          <span class="paddedline">
            <span class="jobline" id="FIELD_JDES">
              <ul style="font-size:14px">
                <li>
                  <$ExpJobDesc$>
                </li>
              </ul>
            </span>
          </span>
        </div>
      </div>
    </div>
  </div>
</div>', N'<div class="">
  <div class="sortableInner">
    <div id="PARAGRAPH_EXPR_0" class="paragraph PARAGRAPH_EXPR firstparagraph placeholder-text ">
      <div class="clearfix doc-item">
        <span class="dates_wrapper">
          <span class="jobdates" id="FIELD_JSTD" format="%b %Y">
            <$EduStartDate$>
          </span>
          <span dependency="JSTD+EDDT"> - </span>
          <span class="jobdates" id="FIELD_EDDT" format="%b %Y"> <$EduEndDate$></span>
        </span>
        <div class="singlecolumn">
          <span class="paddedline pb5" dependency="JTIT">
            <span class="jobtitle" id="FIELD_JTIT">
              <$Education$>
            </span>
          </span>
          <span style="font-size:14px" class="paddedline txtItalics pb5" dependency="COMP|JSTA|JCIT">
            <span class="companyname" id="FIELD_COMP">
              <$EduSchool$>
            </span>
            <span dependency="COMP+JCIT|JSTA">, </span>
            <span class="joblocation jobcity" id="FIELD_JCIT">
              <$EduCity$>
            </span>
            <span class="joblocation jobstate" id="FIELD_JSTA"></span>
          </span>
        </div>
      </div>
    </div>
  </div>
</div>', N'  <span class="ratingfield" id="FIELD_SKC1">    <ul style="font-size:16px">      <li>        <$SkillName$>      </li>    </ul>  </span>', N' <span class="ratingfield" id="FIELD_SKC1">    <ul style="font-size:16px">      <li>        <$HobbyName$>      </li>    </ul>  </span>', N' <span class="ratingfield" id="FIELD_SKC1">    <ul style="font-size:16px">      <li>        <$LangName$>      </li>    </ul>  </span>')
INSERT [RB].[TemplateDetails] ([TemplateId], [TemplateName], [TemplateHtml], [IsActive], [CreateOn], [ModifiedOn], [TemplateImgPath], [ExperienceHtml], [EducationHtml], [SkillsHtml], [HobbyHtml], [LanguageHtml]) VALUES (1003, N'Resume 4', N'<div>
  <div class="container" id="printArea" style="max-width: 700px;       background: #fff;    margin: 0px auto 0px;     box-shadow: 1px 1px 5px #DAD7D7;    border-radius: 3px;      padding: 40px;    margin-top: 50px;">
    <div class="" tabindex="0">
      <div>
        <style type="text/css" id="static">
          /*Font support for MAC*/
          @font-face {
            font-family: ''Century Gothic'';
            font-weight: normal;
            font-style: normal;
            src: local(''Century Gothic''), url(''/blobcontent/zty/fonts/CenturyGothic.ttf'') format(''truetype'')
          }

          @font-face {
            font-family: ''Century Gothic'';
            font-weight: bold;
            font-style: normal;
            src: local(''Century Gothic Bold''), url(''/blobcontent/zty/fonts/CenturyGothicBold.ttf'') format(''truetype'')
          }

          @font-face {
            font-family: ''Century Gothic'';
            font-weight: bold;
            font-style: italic;
            src: local(''Century Gothic Bold Italic''), url(''/blobcontent/zty/fonts/CenturyGothicBoldItalic.ttf'') format(''truetype'')
          }

          @font-face {
            font-family: ''Century Gothic'';
            font-weight: normal;
            font-style: italic;
            src: local(''Century Gothic Italic''), url(''/blobcontent/zty/fonts/CenturyGothicItalic.ttf'') format(''truetype'')
          }

          html,
          body,
          div,
          span,
          applet,
          object,
          iframe,
          h1,
          h2,
          h3,
          h4,
          h5,
          h6,
          p,
          blockquote,
          pre,
          a,
          abbr,
          acronym,
          address,
          big,
          cite,
          code,
          del,
          dfn,
          em,
          font,
          img,
          ins,
          kbd,
          q,
          s,
          samp,
          small,
          strike,
          strong,
          sub,
          sup,
          tt,
          var,
          b,
          u,
          i,
          center,
          dl,
          dt,
          dd,
          ol,
          ul,
          li,
          fieldset,
          form,
          label,
          legend,
          table,
          caption,
          tbody,
          tfoot,
          thead,
          tr,
          th,
          td {
            margin: 0;
            padding: 0;
            border: 0;
            outline: 0;
            vertical-align: baseline;
            background: transparent
          }

          body {
            line-height: 1;
            text-align: left;
            font-feature-settings: "liga"0;
            -moz-font-feature-settings: "liga"off
          }

          .skn-trz6 ol,
          .skn-trz6 ul {
            list-style: none
          }

          .skn-trz6 table {
            border-collapse: collapse;
            border-spacing: 0;
            font-size: inherit;
            color: inherit;
            width: 100%
          }

          /*START content disc style for LI*/
          .skn-trz6 ul,
          .skn-trz6 li {
            margin: 0;
            padding: 0;
            list-style-type: disc
          }

          .skn-trz6 ul li {
            margin: 0 0 0 16px;
            padding: 0
          }

          @-moz-document url-prefix() {
            .skn-trz6 ul li {
              margin: 0 0 0 12px;
              padding: 0 0 0 3px
            }
          }

          /*END content disc style for LI*/
          /*common style*/
          .skn-trz6 .txtBold {
            font-weight: bold
          }

          .skn-trz6 .paddedline {
            display: block
          }

          .skn-trz6 .pt5 {
            padding-top: 5px
          }

          .skn-trz6 .pb5 {
            padding-bottom: 5px
          }

          .skn-trz6 .word-break {
            word-wrap: break-word
          }

          .skn-trz6 .disp-n {
            display: none
          }

          /*For resume title - to be remove later*/
          /* table skills */
          .skn-trz6 table.skills,
          .table_wrapper {
            width: 100%;
            margin-top: 0;
            word-wrap: break-word
          }

          .skn-trz6 table.skills th,
          table.skills td {
            width: 20%;
            text-align: center
          }

          .skn-trz6 table.skills .skillname,
          .skn-trz6 table.skills .skillrating {
            text-align: left;
            width: 35%
          }

          .skn-trz6 table.skills .skillrating {
            width: 20%
          }

          .skn-trz6 table.skills .skillyears,
          .skn-trz6 table.skills .skilllast {
            width: 19%
          }

          .skn-trz6 table.skills .pad1 {
            width: 5%
          }

          .skn-trz6 .skills .pad2,
          .skn-trz6 table.skills .pad3 {
            width: 1%
          }

          /* document */
          .skn-trz6 {
            box-sizing: border-box;
            padding: 20px 20px 20px 0;
            border-left: 85px solid transparent !important;
            color: #343434;
            font-variant-ligatures: none;
            line-height: 16px;
            min-height: 792px
          }

          .skn-trz6 .name {
            color: #373d48;
            font-weight: 700;
            text-align: left;
            display: table-cell;
            min-height: 86px;
            padding-bottom: 10px;
            width: 100%;
            max-width: 100%;
            display: inline-block
          }

          .skn-trz6 .address .singlecolumn {
            margin-left: 0 !important
          }

          .skn-trz6 .degreeGap {
            margin-bottom: 4px
          }

          .skn-trz6 .locationGap {
            margin-top: 4px
          }

          .skn-trz6 .heading {
            font-weight: 700;
            margin-bottom: 10px;
            position: relative
          }

          .skn-trz6 .sectiontitle {
            color: #373d48;
            line-height: 21px;
            word-wrap: break-word
          }

          .skn-trz6 .firstparagraph {
            padding-top: 0 !important
          }

          .skn-trz6 .parentContainer {
            border-collapse: collapse;
            display: table;
            min-height: inherit;
            table-layout: fixed;
            width: 100%
          }

          /*monogram*/
          .skn-trz6 .monogram {
            position: absolute;
            left: -103px;
            top: 0;
            bottom: 0
          }

          .skn-trz6 .monogram svg text {
            font-size: 28px;
            font-style: italic;
            font-weight: 400;
            text-transform: lowercase
          }

          /*leftBox and rightBox css*/
          .skn-trz6 .left-box,
          .skn-trz6 .right-box {
            box-sizing: initial;
            display: table-cell;
            padding-left: 15px;
            vertical-align: top
          }

          .skn-trz6 .left-box .firstsection {
            margin: 0;
            padding: 0;
            min-height: 101px
          }

          .skn-trz6 .left-box .paddedline.date-content {
            position: absolute;
            margin-left: 0;
            width: 65px;
            left: -97px
          }

          .skn-trz6 .paragraph,
          .skn-trz6 .left-box .singlecolumn {
            position: relative
          }

          .skn-trz6 .left-box .paragraph {
            margin-left: 0
          }

          .skn-trz6 .section:empty,
          .skn-trz6 .hide-bar .noLnht,
          .skn-trz6 .hide-bar .field-ratt {
            display: none
          }

          .skn-trz6 .left-box .section {
            border-left: 1px solid #d7d7d7;
            margin-left: 12px;
            padding-left: 25px;
            position: relative
          }

          .skn-trz6 .left-box {
            padding-left: 0;
            padding-right: 15px
          }

          .skn-trz6 .left-box>.section:first-child {
            border: 0
          }

          .skn-trz6 .firstsection+.section:before {
            border: 1px solid #fff;
            content: '''';
            left: -1px;
            position: absolute;
            top: 0
          }

          .skn-trz6 .left-box .singlecolumn:before {
            background: #373d48;
            border: 0;
            border-radius: 100%;
            content: "";
            display: block;
            height: 8px;
            left: -29px;
            position: absolute;
            width: 8px;
            z-index: 2
          }

          .skn-trz6 .right-box .sectiontitle {
            padding-left: 35px
          }

          .skn-trz6 .headingIcon svg circle,
          .skn-trz6 .monogram svg circle {
            fill: #373d48
          }

          /* Icon */
          .skn-trz6 .headingIcon svg {
            width: 30px;
            height: 30px
          }

          .skn-trz6 .headingIcon {
            z-index: 4
          }

          .skn-trz6 .left-box .headingIcon {
            left: -40px;
            position: absolute
          }

          .skn-trz6 .right-box .headingIcon {
            left: 0;
            position: absolute
          }

          .skn-trz6 .headingIcon svg path {
            fill: #fff
          }

          .skn-trz6 .ratingWrapper {
            text-align: right
          }

          .skn-trz6 .ratingWrapper .noLnht {
            line-height: 0
          }

          .skn-trz6 .ratingWrapper svg {
            height: 13px
          }

          /* Issues fix for builder page */
          #displayResume div.skn-trz6.document {
            min-height: 792px
          }

          .skn-trz6>div {
            min-height: inherit
          }

          .skn-trz6>div:not(.topsection),
          .skn-trz6>div:not(.parentContainer) {
            min-height: auto
          }

          .skn-trz6 .right-box>.sortable-item:first-child .section {
            padding-top: 10px !important
          }

          .skn-trz6 .SortableInner>.sortable-item:last-of-type .singlecolumn>.pb5 {
            margin-bottom: 0
          }

          .skn-trz6 .left-box>.sortable-item:first-child .section,
          .skn-trz6 .right-box>.sortable-item:first-child .section {
            padding-top: 0
          }

          .skn-trz6 .left-box .sortable-item:first-child>.section {
            border: 0
          }

          .skn-trz6 .left-box .sortable-item:first-child+.sortable-item>.section {
            padding-top: 0 !important
          }

          .skn-trz6 .ratingWrapper .default-fill {
            fill: #373d48
          }

          .skn-trz6 .sortable-item .ratingWrapper span {
            top: 0;
            line-height: inherit
          }

          .finalize-resume-preview.TRZ6>.skn-trz6 {
            border: 1px solid #e3e7e9 !important;
          }

          .finalize-resume-preview.TRZ6>.skn-trz6 .left-box {
            padding-left: 85px
          }

          /* Only for firefox */
          @-moz-document url-prefix() {
            .skn-trz6 .parentContainer {
              height: 1px
            }
          }

          .skn-trz6 .resumeTitle {
            font-weight: normal
          }

          /*PICT*/
          .skn-trz6 .prflPic,
          .skn-trz6 .prflPic>div {
            width: 155px;
            height: 155px
          }

          .skn-trz6 .prflPic img {
            min-width: 100%;
            max-width: 100%;
            min-height: 100%;
            max-height: 100%
          }
        </style>
        <style type="text/css" id="dynamic" data-time="Sat Apr 01 2023 17:59:41 GMT+0530 (India Standard Time)">
          .skn-trz6,
          .skn-trz6 table {
            line-height: 18px
          }

          .skn-trz6.fontface {
            font-family: Century Gothic
          }

          .skn-trz6.fontsize {
            font-size: 11px
          }

          .skn-trz6 .section {
            padding-top: 15px
          }

          .skn-trz6 .left-box .section:after {
            padding-bottom: 10px
          }

          .skn-trz6 .paragraph {
            padding-bottom: 15px
          }

          .skn-trz6 .rtngSec .paragraph {
            padding-bottom: 5px
          }

          .skn-trz6 .singlecolumn,
          .skn-trz6 .maincolumn {
            word-wrap: break-word
          }

          .skn-trz6 left-box .singlecolumn,
          .skn-trz6 left-box .maincolumn {
            margin-left: 0px
          }

          .skn-trz6 table.skills td {
            padding-top: 2px
          }

          .skn-trz6 .jobtitle,
          .skn-trz6 .degree,
          .skn-trz6 .programline {
            font-size: 14px
          }

          .skn-trz6 .name {
            color: #1a409a;
            font-size: 36px;
            line-height: 42px
          }

          .skn-trz6 .monogram svg circle {
            fill: #1a409a
          }

          .skn-trz6 .sectiontitle,
          .skn-trz6 .resumeTitle {
            font-size: 16px;
            line-height: 23px
          }

          .skn-trz6 .sectiontitle {
            color: #1a409a
          }

          .skn-trz6 .right-box {
            width: 155px
          }

          .skn-trz6 .firstsection+.section:before {
            height: -4px
          }

          .skn-trz6 .left-box .heading~.paragraph .date-content:before {
            background: #1a409a
          }

          .skn-trz6 .left-box .singlecolumn:before {
            background: #1a409a;
            top: 5px
          }

          .skn-trz6 .left-box .paddedline.date-content {
            line-height: 19px
          }

          .skn-trz6 .left-box .section.notdraggable+.section {
            padding-top: 0px
          }

          /* Icon */
          .skn-trz6 .headingIcon svg circle {
            fill: #1a409a
          }

          .skn-trz6 .headingIcon {
            top: -4px
          }

          /*Fixes for builder page*/
          .skn-trz6 .sortableInner .sortable-item.active>.wrapper-bg+div[data-section] {
            position: relative;
            z-index: 8
          }

          .parent-drag.active.skn-trz6,
          ._single-parent-drag.active.skn-trz6 {
            border: 0 !important
          }

          .skn-trz6 .ratingWrapper .default-fill {
            fill: #1a409a
          }

          /*Hover border style*/
          .skn-trz6.active .wrapper-bg {
            left: -62px !important;
            right: -62px !important
          }

          .skn-trz6.active .acrs-bdr {
            left: -60px !important
          }

          .skn-trz6.active .acr-edit,
          .skn-trz6.active .acr-delete {
            left: -59px !important
          }

          .skn-trz6.active .acr-move {
            right: -59px !important
          }

          .skn-trz6 .SECTION_CNTC .paragraph {
            padding-bottom: 0 !important
          }

          .skn-trz6 .SECTION_CNTC+.section {
            padding-top: 30px !important
          }
        </style>
      </div>
      <div class="document doc-root fontsize fontface vmargins hmargins   pagesize skn-trz6 TRZ6  ZTY ">
        <div id="CONTAINER_PARENT_0" class="parentContainer">
          <div id="CONTAINER_0" class="left-box">
            <div data-react-beautiful-dnd-draggable="121" class="sortable-item section-container SortableItem-sibling  data-NAME">
              <div class="document-tool sec-tool" id="editIcons" style="right: -2px;"></div>
              <div id="SECTION_NAMEdd726a98-8ce4-4a84-abe9-71d42ddfc5f2" class="section notdraggable SECTION_NAME    " data-section-cd="NAME">
                <div class=" doc-item">
                  <div class="">
                    <div class="">
                      <div id="PARAGRAPH_NAME_ab68583e-bfbc-4374-a66d-1249fef4ecb4" class="paragraph PARAGRAPH_NAME firstparagraph  ">
                        <div>
                          <div class="monogram" dependency="FNAM|LNAM">
                            <svg height="86px" width="86px">
                              <circle cx="43px" cy="43px" r="43px" fill="#003D74"></circle>
                            </svg>
                          </div>
                          <div class="name">
                            <div class="flname txtBold word-break">
                              <span id="FIELD_FNAM">
                                <$FIRSTNAME$>
                              </span>
                              <span id="FIELD_LNAM">
                                <$LASTNAME$>
                              </span>
                              <div class="resumeTitle placeholder-text" id="FIELD_DCTL">
                                <$JOBTITLE$>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div data-react-beautiful-dnd-draggable="121" class="sortable-item section-container SortableItem-sibling  data-SUMM">
              <div class="document-tool sec-tool" id="editIcons" style="right: -2px;"></div>
              <div id="SECTION_SUMMbb0e4c57-65b0-47e5-b219-9fefa09f24b3" class="section summary notdraggable SECTION_SUMM  noparagraph  has-title " data-section-cd="SUMM">
                <div class=" doc-item">
                  <div class="heading">
                    <div class="headingIcon">
                      <svg viewBox="0 0 54 54">
                        <circle cx="27" cy="27" r="26"></circle>
                        <path transform="translate(11,11)" d="M31 15h-1.051C29.457 8.079 23.922 2.543 17 2.05V1a1 1 0 0 0-2 0v1.05C8.078 2.545 2.543 8.08 2.051 15H1a1 1 0 0 0 0 2h1.051C2.543 23.921 8.078 29.456 15 29.949V31a1 1 0 0 0 2 0v-1.05c6.922-.494 12.457-6.029 12.949-12.95H31a1 1 0 1 0 0-2zm-5 2h1.949c-.483 5.819-5.13 10.466-10.949 10.949V26a1 1 0 0 0-2 0v1.949C9.181 27.466 4.534 22.819 4.051 17H6a1 1 0 0 0 0-2H4.051C4.534 9.181 9.181 4.534 15 4.051V6a1 1 0 0 0 2 0V4.051c5.819.483 10.466 5.13 10.949 10.949H26a1 1 0 0 0 0 2z"></path>
                        <path transform="translate(11,11)" d="M19 16c0-1.654-1.346-3-3-3-1.655 0-3 1.346-3 3s1.345 3 3 3 3-1.346 3-3zm-4 0c0-.551.449-1 1-1 .551 0 1 .449 1 1 0 .551-.449 1-1 1-.551 0-1-.449-1-1z"></path>
                        <path transform="translate(11,11)" d="M17 10a1 1 0 0 0-1-1c-3.86 0-7 3.14-7 7a1 1 0 0 0 2 0c0-2.757 2.243-5 5-5a1 1 0 0 0 1-1zM22 15a1 1 0 0 0-1 1c0 2.757-2.244 5-5 5a1 1 0 1 0 0 2c3.86 0 7-3.14 7-7a1 1 0 0 0-1-1z"></path>
                      </svg>
                    </div>
                    <div class="sectiontitle" id="SECTIONNAME_SUMM">Professional Summary <span title="Rename Professional Summary section" class="rename-section text-rename"></span>
                    </div>
                  </div>
                  <div class="">
                    <div class="">
                      <div id="PARAGRAPH_SUMM_0" class="paragraph PARAGRAPH_SUMM firstparagraph placeholder-text ">
                        <div class="clearfix doc-item">
                          <div class="singlecolumn noPind" id="FIELD_FRFM" style="     font-size: 14px;">
                            <$SUMMARY$>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div data-react-beautiful-dnd-draggable="121" class="sortable-item section-container SortableItem-sibling  data-EXPR" style="<$ISDISPLAYEXP$>">
              <div class="document-tool sec-tool" id="editIcons" style="right: -2px;"></div>
              <div id="SECTION_EXPR5608f65f-6e6c-418c-8bb7-8e9973c7de87" class="section SECTION_EXPR  noparagraph multi-para has-title " data-section-cd="EXPR">
                <div class=" doc-item">
                  <div class="heading">
                    <div class="headingIcon">
                      <svg viewBox="0 0 54 54">
                        <circle cx="27" cy="27" r="26"></circle>
                        <path transform="translate(11,11)" d="M30 5.983h-7.987V4.045c0-1.655-1.345-3-3-3h-6.015c-1.655 0-3 1.345-3 3v1.938H2.001C.9 5.983 0 6.883 0 7.982V28.953c0 1.1.9 2.001 2 2.001h28c1.099 0 2-.9 2-2V7.981a2.008 2.008 0 0 0-2-1.999zM12 4.045c0-.551.447-1 1-1h6.011c.55 0 1 .447 1 1v1.938H12V4.045zM2 7.982h28v7.008H18.986v-1.025c0-1.101-.897-2-1.998-2h-1.993c-1.101 0-2 .897-2 2v1.025H2V7.982zm14.989 11.02h-1.993v-5.037h1.993v5.037zM2 28.951V16.988h10.997V19c0 1.102.897 2 2 2h1.99a2.002 2.002 0 0 0 2-2v-2.01h11.011v11.963H2.001z"></path>
                      </svg>
                    </div>
                    <div class="sectiontitle" id="SECTIONNAME_EXPR">Work History <span title="Rename Work History section" class="rename-section text-rename"></span>
                    </div>
                  </div>
                  <$ExperienceHtml$>
                </div>
              </div>
            </div>
            <div data-react-beautiful-dnd-draggable="121" class="sortable-item section-container SortableItem-sibling  data-EDUC" style="<$ISDISPLAYEDU$>">
              <div class="document-tool sec-tool" id="editIcons" style="right: -2px;"></div>
              <div id="SECTION_EDUCb4a7a80a-6296-4cd8-a2b2-bcb48bcfe003" class="section SECTION_EDUC  noparagraph multi-para has-title " data-section-cd="EDUC">
                <div class=" doc-item">
                  <div class="heading">
                    <div class="headingIcon">
                      <svg viewBox="0 0 54 54">
                        <circle cx="27" cy="27" r="26"></circle>
                        <path transform="translate(11,11)" d="M30.96 22.58v-9.217l.503-.303c.327-.194.533-.58.537-1 .004-.421-.196-.81-.518-1.014L16.44 1.848a.893.893 0 0 0-.967.004l-14.96 9.21c-.318.202-.515.587-.513 1.005.002.417.203.8.525.998l6.573 3.999a1.256 1.256 0 0 0-.133.56v9.669c0 .325.122.637.335.853.217.22 2.294 2.146 8.646 2.146 6.33 0 8.463-1.82 8.686-2.028a1.21 1.21 0 0 0 .367-.884v-9.917c0-.16-.03-.313-.082-.452l4.044-2.441v8.016c-.593.396-.995 1.124-.995 1.965 0 1.262.895 2.285 2 2.285 1.104 0 1.999-1.023 1.999-2.285 0-.845-.407-1.576-1.005-1.97zM23 26.725c-.787.432-2.866 1.282-7.054 1.282-4.214 0-6.246-.905-6.982-1.34v-8.468l6.493 3.95a.892.892 0 0 0 .937.006L23 18.17v8.556zm-7.06-6.876L3.08 12.045l12.881-7.89 12.922 7.868L15.94 19.85z"></path>
                      </svg>
                    </div>
                    <div class="sectiontitle" id="SECTIONNAME_EDUC">Education <span title="Rename Education section" class="rename-section text-rename"></span>
                    </div>
                  </div>
                  <$EducationHtml$>
                </div>
              </div>
            </div>
            <div data-react-beautiful-dnd-draggable="121" class="sortable-item section-container SortableItem-sibling  data-EDUC" style="<$ISDISPLAYHOBBY$>">
              <div class="document-tool sec-tool" id="editIcons" style="right: -2px;"></div>
              <div id="SECTION_EDUCb4a7a80a-6296-4cd8-a2b2-bcb48bcfe003" class="section SECTION_EDUC  noparagraph multi-para has-title " data-section-cd="EDUC">
                <div class=" doc-item">
                  <div class="heading">
                    <div class="headingIcon">
                      <svg viewBox="0 0 54 54">
                        <circle cx="27" cy="27" r="26"></circle>
                        <path transform="translate(11,11)""></path>
											</svg>
										</div>
										<div class=" sectiontitle" id="SECTIONNAME_EDUC">Hobby <span title="Rename Education section" class="rename-section text-rename"></span>
                    </div>
                  </div>
                  <$HobbyHtml$>
                </div>
              </div>
            </div>
			 <div data-react-beautiful-dnd-draggable="121" class="sortable-item section-container SortableItem-sibling  data-EDUC" style="<$ISDISPLAYLANG$>">
              <div class="document-tool sec-tool" id="editIcons" style="right: -2px;"></div>
              <div id="SECTION_EDUCb4a7a80a-6296-4cd8-a2b2-bcb48bcfe003" class="section SECTION_EDUC  noparagraph multi-para has-title " data-section-cd="EDUC">
                <div class=" doc-item">
                  <div class="heading">
                    <div class="headingIcon">
                      <svg viewBox="0 0 54 54">
                        <circle cx="27" cy="27" r="26"></circle>
                        <path transform="translate(11,11)""></path>
											</svg>
										</div>
										<div class=" sectiontitle" id="SECTIONNAME_EDUC">Languages <span title="Rename Education section" class="rename-section text-rename"></span>
                    </div>
                  </div>
                  <$LanguageHtml$>
                </div>
              </div>
            </div>
          </div>
          <div id="CONTAINER_1" class="right-box">
            <div data-react-beautiful-dnd-draggable="121" class="sortable-item section-container SortableItem-sibling  data-PICT">
              <div class="document-tool sec-tool" id="editIcons" style="right: -2px;"></div>
              <div id="SECTION_PICT8b5f790d-efca-89d8-81ee-286b0d7cee2a" class="section photo notdraggable SECTION_PICT firstsection noparagraph  " data-section-cd="PICT">
                <div class=" doc-item">
                  <div class="">
                    <div class="">
                      <div id="PARAGRAPH_PICT_0" class="paragraph PARAGRAPH_PICT firstparagraph placeholder-text ">
                        <div class="clearfix doc-item">
                          <div class="prflPic">
                            <div id="FIELD_PURL"></div>
                          </div>
                          <div class="clear"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div data-react-beautiful-dnd-draggable="121" class="sortable-item section-container SortableItem-sibling  data-CNTC">
              <div class="document-tool sec-tool" id="editIcons" style="right: -2px;"></div>
              <div id="SECTION_CNTC5fda833b-2fa2-44a0-8c80-7c60c9172adc" class="section SECTION_CNTC notdraggable    has-title " data-section-cd="CNTC">
                <div class=" doc-item">
                  <div class="heading">
                    <div class="headingIcon">
                      <svg viewBox="0 0 54 54">
                        <circle cx="27" cy="27" r="26"></circle>
                        <path transform="translate(11,11)" d="M31.85 27.626c-1.38-3.684-3.906-4.604-5.973-4.835-1.608-.23-3.216-.92-3.905-1.38v-2.533c1.838-2.302 2.986-5.295 2.986-7.828C24.958 4.835 21.972 0 16 0c-5.972 0-8.958 5.065-8.958 11.05 0 2.763 1.148 5.756 2.986 7.828v2.762c-.69.46-2.297.921-3.905 1.382-2.067.23-4.364 1.15-5.972 4.834-.23.46-.23 1.151.23 1.612C1.759 31.54 9.798 32 16 32c6.432 0 14.241-.46 15.62-2.532.459-.46.459-1.151.23-1.842zM16 1.842c4.594 0 7.152 4.394 7.152 9.228-.28 4.546-2.666 8.112-7.232 8.456-4.449-.462-6.926-4.804-7.04-8.573 0-4.604 2.526-9.111 7.12-9.111zm0 28.086c-12.174 0-14.012-1.611-14.012-1.611 1.149-2.993 2.757-3.454 4.365-3.684 1.837-.23 3.675-.92 4.594-1.381l.918-.46v-2.073c1.149.921 2.527 1.382 4.135 1.382 1.378 0 2.756-.46 3.905-1.382v2.072l.919.46c.918.461 2.756 1.152 4.594 1.382 1.607.23 3.215.69 4.364 3.684.23 0-1.608 1.611-13.782 1.611z"></path>
                      </svg>
                    </div>
                    <div class="sectiontitle" id="SECTIONNAME_CNTC">Contact <span title="Rename Contact section" class="rename-section text-rename"></span>
                    </div>
                  </div>
                  <div class="">
                    <div class="">
                      <div id="PARAGRAPH_CNTC_13fd78c2-6900-43e9-a822-cbcbe0ec0d0e" class="paragraph PARAGRAPH_CNTC firstparagraph  ">
                        <div class="clearfix doc-item">
                          <div class="address">
                            <div class="singlecolumn">
                              <div dependency="STRT|CITY|STAT|ZIPC|ADDR">
                                <div class="txtBold">
                                  <span class="xslt_static_change">Address </span>
                                </div>
                                <div id="FIELD_STRT"></div>
                                <span id="FIELD_CITY"></span>
                                <span id="FIELD_STAT"></span>
                                <span id="FIELD_ZIPC"></span>
                                <span id="FIELD_ADDR">
                                  <$ADDRESS$>
                                </span>
                              </div>
                              <div class="txtBold pt5" dependency="HPHN|CPHN">
                                <span class="xslt_static_change">Phone </span>
                              </div>
                              <div dependency="HPHN">
                                <span id="FIELD_HPHN">
                                  <$PHONENUMBER$>
                                </span>
                              </div>
                              <div class="txtBold pt5" dependency="EMAI">
                                <span class="xslt_static_change">E-mail </span>
                              </div>
                              <div dependency="EMAI" class="word-break">
                                <span id="FIELD_EMAI">
                                  <$EMAIL$>
                                </span>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div data-react-beautiful-dnd-draggable="121" class="sortable-item section-container SortableItem-sibling  data-HILT" style="<$ISDISPLAYSKILLS$>">
              <div class="document-tool sec-tool" id="editIcons" style="right: -2px;"></div>
              <div id="SECTION_HILT2728952d-30a4-407c-a234-a1cf13b47029" class="section rtngSec SECTION_HILT  noparagraph  has-title " data-section-cd="HILT">
                <div class=" doc-item">
                  <div class="heading">
                    <div class="headingIcon">
                      <svg viewBox="0 0 54 54">
                        <circle cx="27" cy="27" r="26"></circle>
                        <path transform="translate(11,11)" d="M31.36 14.293l-3.413-3.413c2.133-.64 3.84-2.773 3.84-5.333C31.787 2.56 29.227 0 26.24 0c-2.347 0-4.48 1.707-5.333 3.84l-3.2-3.2c-.854-.853-2.56-.853-3.414 0L9.6 5.333c-.213.427-.213.854-.213 1.28.213.427.64.64 1.066.427h.64c2.134 0 3.84 1.707 3.84 4.053 0 2.134-1.493 4.054-3.84 4.054-2.133 0-4.053-1.92-4.053-4.054v-.64a1.63 1.63 0 0 0-.427-1.066c-.213-.427-.64-.427-.853 0L.64 14.293c-.853.854-.853 2.347 0 3.414L14.293 31.36c.427.427 1.067.64 1.707.64.64 0 1.28-.213 1.707-.64L31.36 17.707c.853-.854.853-2.56 0-3.414zm-1.493 1.92L16.213 29.867c-.213.213-.426.213-.64 0L2.133 16.213c-.213 0-.213-.426 0-.426l3.414-3.414a5.953 5.953 0 0 0 5.76 4.48c3.2 0 5.76-2.56 5.76-5.973 0-2.773-1.707-5.12-4.267-5.76l2.987-2.987c.213-.213.426-.213.64 0l4.906 4.907c.214.213.854.427 1.067.213.427-.213.64-.64.64-1.066v-.214-.213c0-1.92 1.493-3.413 3.413-3.413 1.92 0 3.414 1.493 3.414 3.413 0 1.92-1.494 3.413-3.414 3.413h-.426c-.427 0-.854.214-1.067.64-.213.427-.213.854.213 1.067l4.694 4.907c.213 0 .213.426 0 .426z"></path>
                      </svg>
                    </div>
                    <div class="sectiontitle" id="SECTIONNAME_HILT">Skills <span title="Rename Skills section" class="rename-section text-rename"></span>
                    </div>
                  </div>
                  <$SkillsHtml$>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div></div>
    </div>
  </div>
  <div class="track-horizontal" style="display: none; visibility: hidden;">
    <div style="position: relative; display: block; height: 100%; cursor: pointer; border-radius: inherit; background-color: rgba(0, 0, 0, 0.2); width: 0px;"></div>
  </div>
  <div class="track-vertical" style="visibility: visible;"></div>
</div>', 1, CAST(N'2023-03-11T22:02:07.707' AS DateTime), NULL, N'/dist/img/Templates/Resume4.png', N'<div class="">
                    <div class="sortableInner">
                      <div id="PARAGRAPH_EXPR_0" class="paragraph PARAGRAPH_EXPR firstparagraph placeholder-text ">
                        <div class="clearfix doc-item">
                          <div class="paddedline date-content" style="font-size:12px">
                            <span class="jobdates" id="FIELD_JSTD" format="%Y-%m"><$ExpStartDate$></span>
                            <span dependency="JSTD+EDDT"> - </span>
                            <span class="jobdates" id="FIELD_EDDT" format="%Y-%m"><$ExpEndDate$></span>
                            <br dependency="JTIT|COMP|JSTA|JCIT">
                          </div>
                          <div class="singlecolumn">
                            <span class="paddedline" dependency="JTIT">
                              <span class="jobtitle txtBold" id="FIELD_JTIT"><$ExpJobTitle$></span>
                            </span>
                            <span style="font-size:14px" class="paddedline locationGap pb5" dependency="COMP|JSTA|JCIT">
                              <span class="companyname" id="FIELD_COMP"><$ExpEmployer$></span>
                              <span dependency="COMP+JCIT|JSTA">,</span>
                              <span class="jobcity" id="FIELD_JCIT"><$ExpCity$></span>
                              <span class="jobstate" id="FIELD_JSTA"></span>
                            </span>
                            <span class="jobline" id="FIELD_JDES">
                              <ul style="font-size:14px">
                                <li><$ExpJobDesc$></li>
                              </ul>
                            </span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>', N'<div class="">
                    <div class="">
                      <div id="PARAGRAPH_EDUC_0" class="paragraph PARAGRAPH_EDUC firstparagraph placeholder-text ">
                        <div class="clearfix doc-item">
                          <div class="paddedline date-content">
                            <span class="jobdates" id="FIELD_GRST" format="%Y-%m"></span>
                            <span class="jobdates" id="FIELD_GRED" format="%Y-%m"></span>
                          </div>
                          <div class="singlecolumn">
                            <span class="paddedline degreeGap txtBold" dependency="DGRE|STUY">
                              <span class="degree" id="FIELD_DGRE"><$Education$></span>
                              <span class="programline" id="FIELD_STUY"></span>
                            </span>
                            <div style="font-size:14px" class="paddedline pb5" dependency="SCIT|SSTA|SCHO">
                              <span class="companyname" id="FIELD_SCHO"><$EduSchool$></span>
                              <span dependency="SCHO+SSTA|SCIT"> - </span>
                              <span class="joblocation jobcity" id="FIELD_SCIT"><$EduCity$></span>
                            </div>
                            <span id="FIELD_FRFM"></span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>', N'<div class="">
                    <div class="">
                      <div id="PARAGRAPH_HILT_0" class="paragraph PARAGRAPH_HILT firstparagraph placeholder-text ">
                        <div class="clearfix doc-item">
                          <div class="singlecolumn maincolumn">
                            <span class="paddedline" id="FIELD_SKC1">
                              <ul>
                                <li><$SkillName$></li>
                              </ul>
                            </span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>', N'<div class="">
   <div class="">
     <div id="PARAGRAPH_EDUC_0" class="paragraph PARAGRAPH_EDUC firstparagraph placeholder-text ">
       <div class="clearfix doc-item">
         <div class="paddedline date-content">
           <span class="jobdates" id="FIELD_GRST" format="%Y-%m"></span>
           <span class="jobdates" id="FIELD_GRED" format="%Y-%m"></span>
         </div>
         <div class="singlecolumn">
           <span class="paddedline degreeGap txtBold" dependency="DGRE|STUY">
             <span class="degree" id="FIELD_DGRE">
               <$HobbyName$>
             </span>
           </span>
           <span id="FIELD_FRFM"></span>
         </div>
       </div>
     </div>
   </div>
 </div>', N'<div class="">    <div class="">      <div id="PARAGRAPH_EDUC_0" class="paragraph PARAGRAPH_EDUC firstparagraph placeholder-text ">        <div class="clearfix doc-item">          <div class="paddedline date-content">            <span class="jobdates" id="FIELD_GRST" format="%Y-%m"></span>            <span class="jobdates" id="FIELD_GRED" format="%Y-%m"></span>          </div>          <div class="singlecolumn">            <span class="paddedline degreeGap txtBold" dependency="DGRE|STUY">              <span class="degree" id="FIELD_DGRE">                <$LangName$>              </span>            </span>            <span id="FIELD_FRFM"></span>          </div>        </div>      </div>    </div>  </div>')
INSERT [RB].[TemplateDetails] ([TemplateId], [TemplateName], [TemplateHtml], [IsActive], [CreateOn], [ModifiedOn], [TemplateImgPath], [ExperienceHtml], [EducationHtml], [SkillsHtml], [HobbyHtml], [LanguageHtml]) VALUES (1004, N'Resume 5', N'<div class="container" id="printArea" style="max-width: 700px;       background: #fff;    margin: 0px auto 0px;     box-shadow: 1px 1px 5px #DAD7D7;    border-radius: 3px;      padding: 40px;    margin-top: 50px;">
    <div class="" tabindex="0">
      <div>
        <style type="text/css" id="static">
          html,
          body,
          div,
          span,
          applet,
          object,
          iframe,
          h1,
          h2,
          h3,
          h4,
          h5,
          h6,
          p,
          blockquote,
          pre,
          a,
          abbr,
          acronym,
          address,
          big,
          cite,
          code,
          del,
          dfn,
          em,
          font,
          img,
          ins,
          kbd,
          q,
          s,
          samp,
          small,
          strike,
          strong,
          sub,
          sup,
          tt,
          var,
          b,
          u,
          i,
          center,
          dl,
          dt,
          dd,
          ol,
          ul,
          li,
          fieldset,
          form,
          label,
          legend,
          table,
          caption,
          tbody,
          tfoot,
          thead,
          tr,
          th,
          td {
            margin: 0;
            padding: 0;
            border: 0;
            outline: 0;
            vertical-align: baseline;
            background: transparent
          }

          body {
            line-height: 1;
            background: #FFF;
            text-align: left;
            font-feature-settings: "liga"0;
            -moz-font-feature-settings: "liga"off
          }

          .skn-trz8 ol,
          .skn-trz8 ul {
            list-style: none
          }

          .skn-trz8 table {
            border-collapse: collapse;
            border-spacing: 0;
            font-size: inherit;
            color: inherit;
            width: 100%
          }

          /*START content disc style for LI*/
          .skn-trz8 ul,
          .skn-trz8 li {
            margin: 0;
            padding: 0;
            list-style-type: disc
          }

          .skn-trz8 ul li {
            margin: 0 0 0 16px;
            padding: 0
          }

          @-moz-document url-prefix() {
            .skn-trz8 ul li {
              margin: 0 0 0 12px;
              padding: 0 0 0 3px
            }
          }

          /*END content disc style for LI*/
          /*topsection css*/
          .skn-trz8 .topsection {
            display: flex;
            flex-wrap: wrap
          }

          .skn-trz8 .left-box,
          .skn-trz8 .right-box {
            display: table-cell;
            vertical-align: top
          }

          .skn-trz8 .left-box {
            box-sizing: initial;
            position: relative;
            width: 100%
          }

          .skn-trz8 .left-box {
            width: 74%;
            flex-grow: 1
          }

          .skn-trz8 span.paddedline {
            display: block
          }

          .skn-trz8 span.jobtitle,
          .skn-trz8 span.degree,
          .skn-trz8 span.programline {
            font-weight: bold
          }

          .skn-trz8 .mb5 {
            margin-bottom: 5px
          }

          .skn-trz8 .txtItalics {
            font-style: italic
          }

          .skn-trz8 .txtBold {
            font-weight: bold
          }

          .skn-trz8 {
            color: #000;
            box-sizing: border-box;
            word-wrap: break-word
          }

          .skn-trz8 .name {
            color: #252932;
            font-size: 15px;
            line-height: 17px;
            font-weight: bold;
            font-style: italic;
            padding: 0;
            text-align: left;
            letter-spacing: -2px
          }

          .skn-trz8 .paragraph {
            position: relative;
            clear: both
          }

          .skn-trz8 .heading {
            clear: both;
            font-weight: bold;
            font-style: italic
          }

          .skn-trz8 .sectiontitle {
            color: #252932;
            border-bottom: 1px solid #CCC;
            letter-spacing: -.5px
          }

          .skn-trz8 .address {
            text-align: left;
            font-size: 0.917em;
            line-height: 1.25em;
            margin-top: 0;
            white-space: nowrap;
            position: relative;
            z-index: 2
          }

          .skn-trz8 .address .txtBold {
            margin-right: 3px
          }

          .skn-trz8 .addressLeft,
          .skn-trz8 .addressRight {
            width: 49%;
            padding: 0 1% 0 0;
            white-space: normal;
            display: inline-block;
            vertical-align: top
          }

          .skn-trz8 .addressRight {
            padding: 0 0 0 1%
          }

          .skn-trz8 .table_wrapper {
            width: 100%;
            margin-top: 0
          }

          .skn-trz8 table.twocol td {
            width: 50%
          }

          .skn-trz8 table.skills {
            width: 100%
          }

          .skn-trz8 table.skills th,
          .skn-trz8 table.skills td {
            width: 20%;
            text-align: center
          }

          .skn-trz8 table.skills th {
            text-decoration: underline
          }

          .skn-trz8 table.skills .skillname,
          .skn-trz8 table.skills .skillrating {
            text-align: left;
            width: 35%
          }

          .skn-trz8 table.skills .skillrating {
            width: 20%
          }

          .skn-trz8 table.skills .skillyears,
          .skn-trz8 table.skills .skilllast {
            width: 19%
          }

          .skn-trz8 table.skills .pad1 {
            width: 5%
          }

          .skn-trz8 table.skills .pad2,
          .skn-trz8 table.skills .pad3 {
            width: 1%
          }

          .skn-trz8 span.dates_wrapper {
            font-weight: bold;
            display: block;
            float: left;
            text-align: left;
            padding-right: 10px
          }

          .skn-trz8 .resumeTitle {
            text-align: left;
            color: #252932;
            font-weight: 700;
            padding-bottom: 5px
          }

          .skn-trz8 td.twocol_2 {
            border-left: 1px solid #FEFDFD
          }

          .skn-trz8 .hide-bar .noLnht,
          .skn-trz8 .hide-bar .field-ratt {
            display: none
          }

          /*fixes for builder page*/
          .skn-trz8 .sortableInner span.dates_wrapper {
            box-sizing: initial
          }

          .skn-trz8 .rating-wrapper .default-fill {
            fill: #252932
          }

          /*Rating bar*/
          .skn-trz8 .rating-wrapper {
            white-space: nowrap
          }

          .skn-trz8 .rating-text,
          .skn-trz8 .rating-svg {
            width: 68%;
            padding: 0 1% 0 0;
            display: inline-block;
            white-space: normal;
            vertical-align: top
          }

          .skn-trz8 .rating-svg {
            width: 30%;
            text-align: right;
            padding: 0
          }

          .skn-trz8 .rating-svg .noLnht {
            line-height: 0
          }

          .skn-trz8 svg {
            height: 13px
          }

          /*PICT*/
          .skn-trz8 .prflPic,
          .skn-trz8 .prflPic>div {
            float: right;
            width: 122px;
            height: 122px
          }

          .skn-trz8 .prflPic img {
            min-width: 100%;
            max-width: 100%;
            min-height: 100%;
            max-height: 100%
          }
        </style>
        <style type="text/css" id="dynamic" data-time="Mon Apr 24 2023 22:27:28 GMT+0530 (India Standard Time)">
          .skn-trz8,
          .skn-trz8 table {
            line-height: 16px
          }

          .skn-trz8.pagesize {
            width: 595px
          }

          .skn-trz8.fontsize {
            font-size: 11px
          }

          .skn-trz8.fontface {
            font-family: Georgia
          }

          .skn-trz8.vmargins {
            padding-top: 24px;
            padding-bottom: 24px
          }

          .skn-trz8.hmargins {
            padding-left: 24px;
            padding-right: 24px
          }

          .skn-trz8 .section {
            padding-top: 20px
          }

          .skn-trz8 .address {
            font-size: 11px;
            line-height: 21px;
            padding-top: 10px
          }

          .skn-trz8 .heading {
            padding-bottom: 10px
          }

          .skn-trz8 .jobtitle,
          span.degree,
          span.programline {
            font-size: 14px
          }

          .skn-trz8 .paragraph {
            padding-top: 10px
          }

          .skn-trz8 .rtngSec .paragraph {
            padding-top: 5px
          }

          .skn-trz8 .firstsection,
          .skn-trz8 .firstparagraph,
          .skn-trz8 .SECTION_CNTC {
            padding-top: 0 !important
          }

          .skn-trz8 .section.photo {
            padding-top: 10px
          }

          .skn-trz8 .singlecolumn,
          .skn-trz8 .maincolumn {
            margin-left: 120px
          }

          .skn-trz8 span.dates_wrapper {
            width: 110px;
            font-size: 11px;
            line-height: 17px
          }

          .skn-trz8 .sectiontitle,
          .skn-trz8 .resumeTitle {
            font-size: 16px;
            line-height: 21px
          }

          .skn-trz8 .name {
            font-size: 36px;
            line-height: 46px
          }

          .skn-trz8 table.skills td {
            padding-top: 5px
          }

          .skn-trz8 .noPind {
            margin-left: 0
          }

          .skn-trz8 .name,
          .skn-trz8 .sectiontitle,
          .skn-trz8 .resumeTitle {
            color: #252932
          }

          .skn-trz8 .rating-svg {
            padding-top: 2px
          }

          /* Phase 2: Issues fix for builder page */
          .skn-trz8 .sortableInner .SortableItem.active>.wrapper-bg+div[data-section] {
            position: relative;
            z-index: 8
          }

          .skn-trz8 .SortableItem .ratingValue,
          .skn-trz8.active .ratingValue {
            margin-top: 0
          }

          .skn-trz8 .rating-wrapper .default-fill {
            fill: #252932
          }
        </style>
      </div>
      <div class="document doc-root fontsize fontface vmargins hmargins   pagesize skn-trz8 TRZ8  ZTY ">
        <div id="CONTAINER_PARENT_0" class="topsection">
          <div id="CONTAINER_0" class="left-box">
            <div data-react-beautiful-dnd-draggable="40" class="sortable-item section-container SortableItem-sibling name-contact ">
              <div class="document-tool sec-tool" id="editIcons" style="right: -2px;" />
              <div id="SECTION_NAMEdd726a98-8ce4-4a84-abe9-71d42ddfc5f2" class="section notdraggable SECTION_NAME    " data-section-cd="NAME">
                <div class=" doc-item">
                  <div class="">
                    <div class="">
                      <div id="PARAGRAPH_NAME_ab68583e-bfbc-4374-a66d-1249fef4ecb4" class="paragraph PARAGRAPH_NAME firstparagraph  ">
                        <div>
                          <div class="name">
                            <span id="FIELD_FNAM">
                              <$FIRSTNAME$>
                            </span>
                            <span dependency="FNAM+LNAM"></span>
                            <span id="FIELD_LNAM">
                              <$LASTNAME$>
                            </span>
                          </div>
                          <div class="resumeTitle placeholder-text" id="FIELD_DCTL">
                            <$JOBTITLE$>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div id="SECTION_CNTC5fda833b-2fa2-44a0-8c80-7c60c9172adc" class="section SECTION_CNTC notdraggable    " data-section-cd="CNTC">
                <div class=" doc-item">
                  <div class="">
                    <div class="">
                      <div id="PARAGRAPH_CNTC_13fd78c2-6900-43e9-a822-cbcbe0ec0d0e" class="paragraph PARAGRAPH_CNTC firstparagraph  ">
                        <div class="clearfix doc-item">
                          <div class="address">
                            <div class="addressLeft">
                              <div dependency="STRT|CITY|STAT|ZIPC|ADDR">
                                <span class="txtBold">
                                  <span class="xslt_static_change">Address </span>
                                </span>
                                <span id="FIELD_STRT" />
                                <span class="spaced" id="FIELD_CITY" />
                                <span class="spaced" id="FIELD_STAT" />
                                <span class="spaced" id="FIELD_ZIPC" />
                                <span class="spaced" id="FIELD_ADDR">
                                  <$ADDRESS$>
                                </span>
                              </div>
                              <div dependency="HPHN|CPHN">
                                <span class="txtBold">
                                  <span class="xslt_static_change">Phone </span>
                                </span>
                                <span id="FIELD_HPHN" dependency="HPHN">
                                  <$PHONENUMBER$>
                                </span>
                                <span id="FIELD_CPHN" />
                              </div>
                              <div dependency="EMAI">
                                <span class="txtBold">
                                  <span class="xslt_static_change">E-mail </span>
                                </span>
                                <span id="FIELD_EMAI">
                                  <$EMAIL$>
                                </span>
                              </div>
                            </div>
                            <div class="addressRight"></div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="doc-overlay section-overlay" style="left:-2px; right: -2px;">
                <span></span>
              </div>
            </div>
          </div>
          <div id="CONTAINER_1" class="right-box">
            <div data-react-beautiful-dnd-draggable="40" class="sortable-item section-container SortableItem-sibling  data-PICT">
              <div class="document-tool sec-tool" id="editIcons" style="right: -2px;" />
              <div id="SECTION_PICT8b5f790d-efca-89d8-81ee-286b0d7cee2a" class="section photo notdraggable SECTION_PICT firstsection noparagraph  " data-section-cd="PICT"></div>
            </div>
          </div>
          <div id="CONTAINER_PARENT_1" class="parentContainer">
            <div id="CONTAINER_2">
              <div data-react-beautiful-dnd-draggable="41" class="sortable-item section-container SortableItem-sibling  data-SUMM">
                <div class="document-tool sec-tool" id="editIcons" style="right: -2px;" />
                <div id="SECTION_SUMMbb0e4c57-65b0-47e5-b219-9fefa09f24b3" class="section notdraggable SECTION_SUMM    " data-section-cd="SUMM">
                  <div class=" doc-item">
                    <div class="">
                      <div class="">
                        <div id="PARAGRAPH_SUMM_53022a85-5ca5-76e6-0893-9594a5b50631" class="paragraph PARAGRAPH_SUMM firstparagraph  ">
                          <div class="clearfix doc-item">
                            <div class="singlecolumn noPind" id="FIELD_FRFM">
                              <p>
                                <$SUMMARY$>
                              </p>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div data-react-beautiful-dnd-draggable="41" class="sortable-item section-container SortableItem-sibling  data-HILT">
                <div class="document-tool sec-tool" id="editIcons" style="right: -2px;" />
                <div id="SECTION_HILT2728952d-30a4-407c-a234-a1cf13b47029" class="section rtngSec SECTION_HILT  noparagraph  has-title " data-section-cd="HILT">
                  <div class=" doc-item">
                    <div class="heading">
                      <div class="sectiontitle" id="SECTIONNAME_HILT">Skills <span title="Rename Skills section" class="rename-section text-rename" />
                      </div>
                    </div>
                    <div class="">
                      <div class="">
                        <div id="PARAGRAPH_HILT_0" class="paragraph PARAGRAPH_HILT firstparagraph placeholder-text ">
                          <div class="clearfix doc-item">
                            <div class="singlecolumn maincolumn">
                              <div class="rating-wrapper">
                                <div class="rating-text">
                                  <$SkillsHtml$>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div data-react-beautiful-dnd-draggable="41" class="sortable-item section-container SortableItem-sibling  data-EXPR">
                <div class="document-tool sec-tool" id="editIcons" style="right: -2px;" />
                <div id="SECTION_EXPR5608f65f-6e6c-418c-8bb7-8e9973c7de87" class="section SECTION_EXPR  noparagraph multi-para has-title " data-section-cd="EXPR">
                  <div class=" doc-item">
                    <div class="heading">
                      <div class="sectiontitle" id="SECTIONNAME_EXPR">Work History <span title="Rename Work History section" class="rename-section text-rename" />
                      </div>
                    </div>
                   <$ExperienceHtml$>
                  </div>
                </div>
              </div>
              <div data-react-beautiful-dnd-draggable="41" class="sortable-item section-container SortableItem-sibling  data-EDUC">
                <div class="document-tool sec-tool" id="editIcons" style="right: -2px;" />
                <div id="SECTION_EDUCb4a7a80a-6296-4cd8-a2b2-bcb48bcfe003" class="section SECTION_EDUC  noparagraph multi-para has-title " data-section-cd="EDUC">
                  <div class=" doc-item">
                    <div class="heading">
                      <div class="sectiontitle" id="SECTIONNAME_EDUC">Education <span title="Rename Education section" class="rename-section text-rename" />
                      </div>
                    </div>
                    <$EducationHtml$>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div />
      </div>
    </div>
    <div class="track-horizontal" style="display: none; visibility: hidden;">
      <div style="position: relative; display: block; height: 100%; cursor: pointer; border-radius: inherit; background-color: rgba(0, 0, 0, 0.2); width: 0px;" />
    </div>
    <div class="track-vertical" style="visibility: visible;">
      <div style="position: relative; display: block; width: 100%; cursor: pointer; border-radius: inherit; background-color: rgba(0, 0, 0, 0.2); height: 30px; transform: translateY(0px);" />
    </div>', 1, NULL, NULL, N'/dist/img/Templates/Resume5.png', N'<div class="">
   <div class="sortableInner">
     <div id="PARAGRAPH_EXPR_0" class="paragraph PARAGRAPH_EXPR firstparagraph placeholder-text ">
       <div class="clearfix doc-item">
         <span class="dates_wrapper" dependency="JSTD|EDDT">
           <span class="jobdates" id="FIELD_JSTD" format="%Y-%m">
             <$ExpStartDate$>
           </span>
           <span dependency="JSTD+EDDT"> - </span>
           <span class="jobdates" id="FIELD_EDDT" format="%Y-%m">
             <$ExpEndDate$>
           </span>
         </span>
         <div class="singlecolumn">
           <span class="paddedline mb5" dependency="JTIT">
             <span class="jobtitle" id="FIELD_JTIT">
               <$ExpJobTitle$>
             </span>
           </span>
           <span class="paddedline txtItalics mb5" dependency="COMP|JSTA|JCIT">
             <span class="companyname" id="FIELD_COMP">
               <$ExpEmployer$>
             </span>
             <span dependency="COMP+JCIT|JSTA">, </span>
             <span class="joblocation jobcity" id="FIELD_JCIT">
               <$ExpCity$>
             </span>
             <span class="joblocation jobstate" id="FIELD_JSTA" /></span>
           <span class="paddedline">
             <span class="jobline" id="FIELD_JDES">
               <ul>
                 <li>
                   <$ExpJobDesc$>
                 </li>
               </ul>
             </span>
           </span>
         </div>
       </div>
     </div>
     <div id="PARAGRAPH_EXPR_-2" class="paragraph PARAGRAPH_EXPR placeholder-text ">
       <div class="clearfix doc-item">
         <div class="singlecolumn">
           <span class="paddedline">
             <span class="jobline" id="FIELD_JDES" /></span>
         </div>
       </div>
     </div>
   </div>
 </div>', N'<div class="">
  <div class="">
    <div id="PARAGRAPH_EDUC_0" class="paragraph PARAGRAPH_EDUC firstparagraph placeholder-text ">
      <div class="clearfix doc-item">
        <div class="singlecolumn">
          <span class="paddedline mb5" dependency="DGRE|STUY">
            <span class="degree" id="FIELD_DGRE"><$Education$></span>
            <span class="programline" id="FIELD_STUY" /></span>
          <span class="paddedline txtItalics mb5" dependency="SCHO|SCIT|SSTA">
            <span class="companyname companyname_educ" dependency="SCHO" id="FIELD_SCHO"><$EduSchool$></span>
            <span class="statesWrapper" dependency="SCHO+SCIT|SSTA"> - </span>
            <span class="joblocation jobcity" id="FIELD_SCIT"><$EduCity$></span>
            <span dependency="SCIT+SSTA">, </span>
            <span class="joblocation jobstate" id="FIELD_SSTA">
              <$EduStartDate$> - <$EduEndDate$>
            </span>
          </span>
          <span class="paddedline">
            <span id="FIELD_FRFM" /></span>
        </div>
      </div>
    </div>
  </div>
</div>', N'<span id="FIELD_SKC1">
																		<ul>
																			<li><$SkillName$></li>
																											</ul>
																	</span>', NULL, NULL)
SET IDENTITY_INSERT [RB].[TemplateDetails] OFF
GO
