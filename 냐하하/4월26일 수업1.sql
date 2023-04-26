-- getSC firstPorc() 보기
call firstProc(); -- 파라미터 없는상태. 무의미. 어떤값을 주고 뭘 뽑을때이걸 이용. 메소드 같은?
--  getSC stored procedures 보셈
call getSC();


-- /////////////////////////////////////////////////////////////////////////////////////////////
-- getStatus 이거 2줄 다 해줘야 하는데 1줄로만?
call getStatus('London',@total);
select @total;

-- 한줄로만
call getStatus1('london');

-- 한줄로만 교수님
call getStatus2('london', @total);

-- 탭 2개 나오는거. select가 3개 있는거 각자 다 따로된 테이블. 근데 1개는 into로 변수선언용이니 결과는 2개.
call getStatus3('london', @total);
-- /////////////////////////////////////////////////////////////////////////////////////////////

