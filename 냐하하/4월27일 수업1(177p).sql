select * from dept;
select dname, bLevel(budget) from dept;

call getBudgetLevel('Marketing',@level); -- 뒤에꺼 결과값 받아올 변수를 줘야해. 그냥은 인식못해서 @를 붙여줘야한다. 시스템변수처럼.

call findLevel(); -- 위 두줄을 이걸로

-- 프로시져로 프로시져 불러오기.
-- findLevel에 DV-> 없으니까 bLevel에서 else set bl = 'platinum'; 이거실행. 플래티넘


show procedure status; -- 내가 만든 프로시져랑 펑션이 뭐가있지? 하고 볼때. cmd에서 볼때 쓴다.
show function status;