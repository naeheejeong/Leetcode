SELECT * 
FROM products
-- 1. LIKE로 풀기
-- WHERE description LIKE '%SN____-____'  -- 앞에 주저리 ~ SN 일련번호
--    OR description LIKE '%SN____-____ %'; -- 중간에 아무데나 SN 일련번호

-- 2. REGEXP_LIKE(컬럼, '정규식패턴',c or i (대소문자구분여부)) -> True/False로 반환하는 함수
WHERE REGEXP_LIKE(
    description,
    '(^|[^A-Za-z0-9])SN[0-9]{4}-[0-9]{4}([^A-Za-z0-9]|$)',
    'c'
)
order by product_id