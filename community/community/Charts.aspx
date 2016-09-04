<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Charts.aspx.cs" Inherits="community.Charts"  MasterPageFile="~/Site.master"%>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <script type="text/javascript">
            function showFacebookPagesIFrame(paramName, paramValue, iframeId, drillDownPage) {
                var iframe = document.getElementById(iframeId);
                if (iframe) {
                    iframe.src = drillDownPage + '?' + paramName + '=' + paramValue;
                }
            }

            function showFacebookPagesIFrame_HasShortName(paramValue) {
                showFacebookPagesIFrame('HasShortName', paramValue, 'FacebookPagesShortName', 'DrillDown.aspx');
            }

            function showFacebookPagesIFrame_HasPhone(paramValue) {
                showFacebookPagesIFrame('HasPhone', paramValue, 'FacebookPagesPhone', 'DrillDown_FP_HasPhone.aspx');
            }
    </script>
    <div class="SPChartsContainer">
        <div class="SPChart1"><asp:Chart ID="ChartNumberMuniFB" runat="server" DataSourceID="SqlDataSourceNumberMuniFB">
            <Series>
                <asp:Series Name="Series1" XValueMember="year" YValueMembers="muni_in_year">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
          
            <Titles>
                <asp:Title Name="Title1" Text="Number of municipalities which have Facebook presence per year">
                </asp:Title>
            </Titles>
          
        </asp:Chart></div>
        <div class="SPChart2"><asp:Chart ID="ChartCreationDate" runat="server" DataSourceID="SqlDataSourceCreationDate">
                <Series>
                    <asp:Series ChartType="Point" Name="Series1" XValueMember="creation_date" YValueMembers="number_pages">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisX IntervalAutoMode="VariableCount" IntervalType="Weeks">
                            <MajorGrid IntervalType="Weeks" />
                        </AxisX>
                    </asp:ChartArea>
                </ChartAreas>
                <Titles>
                    <asp:Title Name="Title1" Text="Number of municipality Facebook pages per activation date">
                    </asp:Title>
                </Titles>
            </asp:Chart></div>
        <div class="SPChart3"><asp:Chart ID="ChartPagesByCategory" runat="server" DataSourceID="SqlDataSourcePagesByCategory">
            <Series>
                <asp:Series Name="Series1" XValueMember="category" YValueMembers="cnt" IsXValueIndexed="True">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
            <Titles>
                <asp:Title Name="Title1" Text="Number of Facebook pages grouped by category">
                </asp:Title>
            </Titles>
        </asp:Chart></div>
        <div class="SPChart4"><asp:Chart ID="ChartActivity" runat="server" DataSourceID="SqlDataSourceActivity">
            <Series>
                <asp:Series Name="Series1" XValueMember="post_year" YValueMembers="Column1">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
                <Titles>
                    <asp:Title Name="Title1" Text="Number of municipalities with active Facebook pages(have more than 1 post per year)">
                    </asp:Title>
                </Titles>
         </asp:Chart></div>
        <div class="SPChart5"><asp:Chart ID="ChartPostLength" runat="server" DataSourceID="SqlDataSourcePostLenght">
            <Series>
                <asp:Series ChartType="Pie" IsValueShownAsLabel="True" Label="#PERCENT" Legend="Legend1" LegendText="#VALX" Name="Series1" XValueMember="category" YValueMembers="cnt">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
            <Legends>
                <asp:Legend Name="Legend1" Title="Legend">
                </asp:Legend>
            </Legends>
            <Titles>
                <asp:Title Name="Title1" Text="Average length of posts">
                </asp:Title>
            </Titles>
        </asp:Chart></div>
        <div class="SPChart6"><asp:Chart ID="ChartWeeklyActivity" runat="server" DataSourceID="SqlDataSourceWeeklyActivity">
            <Series>
                <asp:Series ChartType="Pie" IsValueShownAsLabel="True" Label="#PERCENT" Legend="Legend1" LegendText="#VALX" Name="Series1" XValueMember="category" YValueMembers="cnt">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
            <Legends>
                <asp:Legend Name="Legend1" Title="Legend">
                </asp:Legend>
            </Legends>
            <Titles>
                <asp:Title Name="Title1" Text="Weekly activity">
                </asp:Title>
            </Titles>
        </asp:Chart></div>
        <div class="SPChart7"><asp:Chart ID="ChartContactDetails" runat="server" DataSourceID="SqlDataSourceContactDetails">
            <Series>
                <asp:Series ChartType="Pie" IsValueShownAsLabel="True" Label="#PERCENT" Legend="Legend1" LegendText="#VALX" Name="Series1" XValueMember="has_all_details_title" YValueMembers="cnt">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
            <Legends>
                <asp:Legend Name="Legend1" Title="Legend">
                </asp:Legend>
            </Legends>
            <Titles>
                <asp:Title Name="Title1" Text="Percentage of municipality facebook pages which have full list of contact details(phone number, email, website)">
                </asp:Title>
            </Titles>
        </asp:Chart></div>
        <div class="SPChart8"><asp:Chart ID="ChartHasAboutPage" runat="server" DataSourceID="SqlDataSourceHasAboutPage">
            <Series>
                <asp:Series ChartType="Pie" IsValueShownAsLabel="True" Label=" #PERCENT" Legend="Legend1" LegendText="#VALX" Name="Series1" XValueMember="has_about_page" YValueMembers="cnt">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
            <Legends>
                <asp:Legend Name="Legend1" Title="Legend">
                </asp:Legend>
            </Legends>
            <Titles>
                <asp:Title Name="Title1" Text="Propotion of municipality facebook pages which have about page">
                </asp:Title>
            </Titles>
        </asp:Chart></div>
        <div class="SPChart9"><asp:Chart ID="ChartHasLocation" runat="server" DataSourceID="SqlDataSourceHasDefinedLocation">
            <Series>
                <asp:Series Name="Series1" ChartType="Pie" Legend="Legend1" XValueMember="has_location" YValueMembers="cnt" IsValueShownAsLabel="True" Label=" #PERCENT" LegendText="#VALX">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
            <Legends>
                <asp:Legend Name="Legend1" Title="Legend">
                </asp:Legend>
            </Legends>
            <Titles>
                <asp:Title Name="defined_location" Text="Propotion of municipalities which have defined locations">
                </asp:Title>
            </Titles>
        </asp:Chart></div>
        <div class="SPChart10"><asp:Chart ID="ChartHasPhone" runat="server" DataSourceID="SqlDataSourceHasPhone" OnDataBound="ChartHasPhone_DataBound">
            <series>
                <asp:Series ChartType="Pie" Name="Series1" XValueMember="has_phone" YValueMembers="cnt" Legend="Legend1" IsValueShownAsLabel="True" Label="#PERCENT " LegendText="#VALX">
                </asp:Series>
            </series>
            <chartareas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </chartareas>
            <Legends>
                <asp:Legend Name="Legend1" Title="Legend">
                </asp:Legend>
            </Legends>
            <Titles>
                <asp:Title Name="Title1" Text="Propotion of municipality facebook pages which have phone numbers">
                </asp:Title>
            </Titles>
        </asp:Chart>
    <iframe id="FacebookPagesPhone" src="DrillDown_FP_HasPhone.aspx" style="border:none;" frameborder="0"></iframe>

        </div>
        <div class="SPChart11"><asp:Chart ID="ChartShortName" runat="server" DataSourceID="SqlDataSourceShortName" OnDataBound="ChartShortName_DataBound">
                <Series>
                    <asp:Series ChartType="Pie" IsValueShownAsLabel="True" Label="#PERCENT" Legend="Legend1" LegendText="#VALX" Name="Series1" XValueMember="has_short_name" YValueMembers="cnt,has_short_name" YValuesPerPoint="2">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
                <Legends>
                    <asp:Legend Name="Legend1" Title="Legend">
                    </asp:Legend>
                </Legends>
                <Titles>
                    <asp:Title Name="Title1" Text="Proportion of municipality facebook pages which use short names in their URLs">
                    </asp:Title>
                </Titles>
            </asp:Chart>
    <iframe id="FacebookPagesShortName" src="DrillDown.aspx" style="border:none;" frameborder="0"></iframe>

        </div>


        <asp:SqlDataSource ID="SqlDataSourceHasDefinedLocation" runat="server" ConnectionString="<%$ ConnectionStrings:Social_PresenceConnectionString %>" SelectCommand="select count(1) AS cnt, has_location  from (
SELECT iif([defined_location] is null, 'yes', 'no') AS has_location FROM [facebook_page]
) as tbl
group by has_location "></asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSourceHasPhone" runat="server" ConnectionString="<%$ ConnectionStrings:Social_PresenceConnectionString %>" SelectCommand="SELECT count(id) as cnt, iif([has_phone] = 1, 'yes', 'no') as has_phone FROM [facebook_page] group by [facebook_page].[has_phone]"></asp:SqlDataSource>
        
        <asp:SqlDataSource ID="SqlDataSourceHasAboutPage" runat="server" ConnectionString="<%$ ConnectionStrings:Social_PresenceConnectionString %>" SelectCommand="SELECT count(id) as cnt, iif([has_about_page] = 1, 'yes', 'no') as has_about_page FROM [facebook_page] group by [facebook_page].[has_about_page]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceShortName" runat="server" ConnectionString="<%$ ConnectionStrings:Social_PresenceConnectionString %>" SelectCommand="select count(1) AS cnt, has_short_name  from (
SELECT iif([short_name] is not null, 'yes', 'no') AS has_short_name FROM [facebook_page]
) as tbl
group by has_short_name"></asp:SqlDataSource>
                    
        <asp:SqlDataSource ID="SqlDataSourceNumberMuniFB" runat="server" ConnectionString="<%$ ConnectionStrings:Social_PresenceConnectionString %>" SelectCommand="select chart_year.year, count(distinct p.municipality_id) as muni_in_year
from [dbo].[facebook_page] as p,
(values (2010), (2011), (2012), (2013), (2014), (2015), (2016)) as chart_year(year)
where year(p.creation_date) &lt;= chart_year.year
group by chart_year.year
order by chart_year.year"></asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSourceCreationDate" runat="server" ConnectionString="<%$ ConnectionStrings:Social_PresenceConnectionString %>" SelectCommand="select creation_date, 
ROW_NUMBER() over (order by creation_date asc) as number_pages
from facebook_page
where creation_date is not null
order by creation_date"></asp:SqlDataSource>
      
        <asp:SqlDataSource ID="SqlDataSourcePagesByCategory" runat="server" ConnectionString="<%$ ConnectionStrings:Social_PresenceConnectionString %>" SelectCommand="SELECT count(id) AS cnt, category FROM [facebook_page] GROUP BY [facebook_page].[category]"></asp:SqlDataSource>
        
        <asp:SqlDataSource ID="SqlDataSourceActivity" runat="server" ConnectionString="<%$ ConnectionStrings:Social_PresenceConnectionString %>" SelectCommand="select count(1), post_year
from (

select year(date) as post_year, facebook_page_id
from post
group by year(date), facebook_page_id) as tbl

group by post_year"></asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSourcePostLenght" runat="server" ConnectionString="<%$ ConnectionStrings:Social_PresenceConnectionString %>" SelectCommand="select count(1) as cnt, category
from
(select 
case
when avglength &lt; 100 and avglength &gt; 0 then '&lt; 100 symbols'
when avglength &gt;= 100 and avglength &lt;= 500 then '100 - 500 symbols'
when avglength &gt; 500 then '&gt; 500 symbols'
else 'no posts'
end as category
from (SELECT AVG(length) as avglength
  FROM
  [dbo].[facebook_page] left join
  [dbo].[post] on [facebook_page].id = post.facebook_page_id
  group by facebook_page_id) as tbl) as tbl2
  group by category"></asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSourceWeeklyActivity" runat="server" ConnectionString="<%$ ConnectionStrings:Social_PresenceConnectionString %>" SelectCommand="select count(1) as cnt, category
from
(select 
case
when avrposts &gt;= 1/3 and avrposts &lt; 1 then 'between 1/3 and 1 posts'
when avrposts &gt;= 1 and avrposts &lt;= 3 then 'between 1 and 3 posts'
when avrposts &gt; 3 then 'more than 3 posts'
else 'less than 1/3 posts'
end as category
from (SELECT cast(count(1) as float) / (DATEDIFF(week, creation_date, max(date)) + 1) as avrposts
  FROM
  [dbo].[facebook_page] left join
  [dbo].[post] on [facebook_page].id = post.facebook_page_id
  group by facebook_page_id, creation_date) as tbl) as tbl2
  group by category"></asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSourceContactDetails" runat="server" ConnectionString="<%$ ConnectionStrings:Social_PresenceConnectionString %>" SelectCommand="select 
count(1) as cnt, 
case has_all_details when 1 then 'yes' else 'no' end as has_all_details_title
from (
  select has_phone &amp; has_email &amp;
    cast(CASE WHEN website is not null THEN 1 ELSE 0 END as bit) as has_all_details
  from facebook_page) as tbl
group by has_all_details"></asp:SqlDataSource>

      </div>

   </asp:Content> 