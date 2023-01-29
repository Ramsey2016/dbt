{{ config(materialized="table") }}

with
    marketing_data as (
        select count(distinct fullvisitorid) as unique_visitors, channelgrouping
        from `data-to-insights.ecommerce.all_sessions`
        group by channelgrouping
        order by channelgrouping desc
    )

select *
from marketing_data
