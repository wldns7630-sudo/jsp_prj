package day0612;

import java.util.ArrayList;
import java.util.List;

public class TestService {

	public List<TestDTO> searchMember(){
		List<TestDTO> list=new ArrayList<TestDTO>();
		
		list.add(new TestDTO("ㅇㅇ",44));
		return list;
	}
}
