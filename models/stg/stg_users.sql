with raw_users as (
    select *
    from {{ ref('base_users') }}
)

select distinct -- remove user_id duplicates
    id             as user_id,
    active         as is_active,
    created_date   as created_date,
    last_login     as last_login,
    role           as user_role,
    sign_up_source as sign_up_source,
    state          as state
from raw_users
-- filter to only customers
where role = 'consumer'
