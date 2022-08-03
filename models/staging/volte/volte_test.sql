
SET json_serialization_enable TO false;
{% set payment_methods = '' %}

with source as (
    select  
        r.recordtype, 
        r.fileName,
        r.lineNumber,
        r.duration,
        na, 
        a,
        cpa,
        subscriptionId.subscriptionIDData,
        r."private-User-Equipment-Info"."private-User-Equipment-Info-Value",
        interOperatorIdentifiers.originatingIOI,
        interOperatorIdentifiers.terminatingIOI,
        r.serviceDeliveryStartTimeStamp,
        r.accessNetworkInformation
    from 
        {{ source('volte', 'volte') }} r,
        r.nodeAddress na, 
        r."list-of-calling-party-address" pa, 
        pa a,
        r."called-Party-Address" cpa,
        r."list-of-subscription-ID" subscriptionId,
        r.interOperatorIdentifiers interOperatorIdentifiers
    WHERE na != 'domainName' and a != 'tEL-URI' and cpa != 'tEL-URI'
),
renamed as (
    select
    --    {{ get_recordid('fileName', 'lineNumber') }} as recordid,
    --    {{get_anumber('a')}}                         as anumber,
    --    {{get_anumber('cpa')}}                       as bnumber,
    --    bnumber                                      as dialeddigits,
    --    duration                                     as duration,
    --    subscriptionIDData                           as aIMSI,
    --    "private-User-Equipment-Info-Value"          as aIMEI,
    --    originatingIOI                               as incomingroute,
    --    terminatingIOI                               as outgoingroute,
    --    serviceDeliveryStartTimeStamp                as datetime,
        {{get_firstCellId('accessNetworkInformation')}} as firstCellId
    from source
)

select * from renamed
