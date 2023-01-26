package org.spring.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.spring.model.Message;
import org.spring.model.Threads;
import org.spring.model.User;

import org.spring.repository.MessageRepository;
import org.spring.repository.ThreadRepository;
import org.spring.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class WebAppService {

	@Autowired
	UserRepository userRepo;

	@Autowired
	ThreadRepository threadRepo;

	@Autowired
	MessageRepository messageRepo;

	private User currentUser;

	public String getUserEmail() {
		return currentUser.getEmail();
	}

	public boolean isOnline() {
		return !getUserEmail().isEmpty();
	}

	public boolean isAdmin() {
		if (this.currentUser == null)
			return false;
		return currentUser.getRole().equalsIgnoreCase("admin");
	}

	public User getCurrentUser() {
		return currentUser;
	}

	public void setCurrentUser(User currentUser) {
		this.currentUser = currentUser;
	}

	public void save(User User) {
		userRepo.save(User);
	}

	public void save(Threads thread) {
		threadRepo.save(thread);
	}

	public void save(Message message) {
		messageRepo.save(message);
	}

	public List<User> listAllUser() {
		return (List<User>) userRepo.findAll();
	}

	public List<Threads> listAllTread() {
		return threadRepo.findAll();
	}

	public List<Message> listAllMessage(long toUser) {
		long id = currentUser.getId();
		return messageRepo.findByToUserIdAndFromUserIdOrFromUserIdAndToUserId(id, toUser, id, toUser);
	}

	public List<User> search(String keyword) {
		return userRepo.search(keyword);
	}

	public User get(Long id) {
		return userRepo.findById(id).get();
	}

	public User findByEmail(String email) {
		return userRepo.findByEmail(email);
	}

	public User findByToken(String token) {
		return userRepo.findByToken(token);
	}

	public void deleteUser(Long id) {
		userRepo.deleteById(id);
	}

	public void deleteThread(Long id) {
		threadRepo.deleteById(id);
	}

	public void deleteMessage(Long id) {
		messageRepo.deleteById(id);
	}
}