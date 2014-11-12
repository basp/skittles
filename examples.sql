select *
from [skittles].[documents]
where [data].exist('/event/tags/tag[text() = "foo"]') = 1

select *
from [skittles].[documents]
where [data].exist('/event/msg/text()[contains(., "quux")]') = 1