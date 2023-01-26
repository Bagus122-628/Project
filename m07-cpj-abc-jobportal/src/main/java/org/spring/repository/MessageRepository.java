package org.spring.repository;

import java.util.List;

import org.spring.model.Message;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MessageRepository extends JpaRepository<Message, Long> {
	
	List<Message> findByToUserIdAndFromUserIdOrFromUserIdAndToUserId(long id1, long id2, long id3, long id4);
}
