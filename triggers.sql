create trigger updatereview after delete on Restaurants referencing old table as dRest for each statement delete from review where rid in (select rid from dRest where rid = deleted.rid)

create trigger mytrigger after delete on restaurants referencing old as old_tab for each row delete from review where review.rid = old_tab.rid