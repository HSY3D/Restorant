create trigger mytrigger after delete on restaurants referencing old as old_tab for each row delete from review where review.rid = old_tab.rid