package org.spring.repository;

import java.util.List;

import org.spring.model.Threads;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ThreadRepository extends JpaRepository<Threads, Long> {
	
	List<Threads> findByPublisherId(long publisherId);
}
