select *
from [skittles].[documents]
where [data].exist('/event/tags/tag[text() = "foo"]') = 1