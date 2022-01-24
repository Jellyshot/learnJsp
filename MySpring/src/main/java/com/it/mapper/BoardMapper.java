package com.it.mapper;

import java.util.List;

//List를 사용하려면 util을 import 해주어야함.
import com.it.domain.BoardVO;


public interface BoardMapper {
//	BoardVO만 들어갈 수 있는  List생성
	public List<BoardVO> getList();
// 멤버변수가 공란이기 때문에 #기호를 사용할 수 없음.
// 나중에 compile을 다시 하지 않기 위해서 BoardMapper.xml과 인터페이스 파일을 따로 만듬.
// 수정이 필요할 경우 xml만 수정하면 되므로.

// 테이블에 맞는 사이즈의 변수(board)에 넣어 전달
// insert와 read의 경우 멤버변수가 들어있기 때문에(BoardVO board) #을 통해 값을 불러올 수 있음.
// insert의 문자형태 void(반환값 없음)
	public void insert(BoardVO board);

/*  b_num을 불러와서 detailview를 만듬. 
 * 	단 b_num 하나만 불러오는게 더 복잡해 지기 때문에, 보드 전체를 불러옴.*/
// read method의 문자열 형태 BoardVO(반환값이 클래스)
	public BoardVO read(BoardVO board);
	
	public void update(BoardVO board);

//num로 삭제를 하고 #으로 값을 받을 수 있게 하기 위한 구문 작성.
	public void delete(BoardVO board);
	
}
