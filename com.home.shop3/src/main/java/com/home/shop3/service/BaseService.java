package com.home.shop3.service;

import java.util.ArrayList; 
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.Table;
//import javax.servlet.jsp.tagext.PageData;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.home.shop3.entities.BaseEntity;

//import com.home.shop3.entities.admin.BaseEntity;



@Service
public abstract class BaseService<E extends BaseEntity> {
	
	private static int SIZE_OF_PAGE = 10;
	public static int NO_PAGING = 1;
	
	@PersistenceContext
	protected EntityManager entityManager;
	
	protected abstract Class<E> clazz();
	
	public E getById(int id) {
			return entityManager.find(clazz(), id);
	}
	
	@SuppressWarnings("unchecked")
	public List<E> findAll() {
		Table tbl = clazz().getAnnotation(Table.class);
		return (List<E>) entityManager.createNativeQuery("SELECT * FROM " + tbl.name(), clazz()).getResultList();
	}
	@Transactional
	public E saveOrUpdate(E entity) {
		if (entity.getId() == null || entity.getId() <= 0) {
			entity.setCreatedDate(new Date());
			entityManager.persist(entity); // thêm mới
			return entity;
		} else {
			return entityManager.merge(entity); // cập nhật
		}
	}

	public void delete(E entity) {
		entityManager.remove(entity);
	}
	public void deleteById(int id) {
			E entity=this.getById(id);
			delete(entity);
	}
	@SuppressWarnings("unchecked")
	public List<E> executeNativeSql(String sql){
		try {
			Query query=entityManager.createNativeQuery(sql,clazz());
			return query.getResultList();
			
		}catch(Exception e) {
			e.printStackTrace();
			return new ArrayList<E>();
		}
	}
	
	@SuppressWarnings("unchecked")
	public PagerData<E> getEntitiesByNativeSQL(String sql, int page) {
		if(page <= 0) throw new RuntimeException("page phải lớn hơn 0");
		PagerData<E> result = new PagerData<E>();
		try {
			Query query = entityManager.createNativeQuery(sql, clazz());
			
			//trường hợp có thực hiện phân trang thì kết quả trả về
			//bao gồm tổng số page và dữ liệu page hiện tại
			if(page > 0) {
				result.setCurrentPage(page);
				result.setTotalItems(query.getResultList().size());
				result.setSizeOfPage(SIZE_OF_PAGE);

				query.setFirstResult((page - 1) * SIZE_OF_PAGE);
				query.setMaxResults(SIZE_OF_PAGE);
			}
			
			result.setData(query.getResultList());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
	/**
	 * thực thi câu lệnh cập nhật cơ sở dữ liệu
	 * @param sql -> ví dụ chạy câu lệnh [DELETE FROM tbl_category;] hoặc [UPDATE tbl_category SET Name = 'Alfred Schmidt' WHERE Id = 1;]
	 * @return
	 */
	public int executeUpdateOrDeleteByNativeSQL(String sql) {
		try {
			return entityManager.createNativeQuery(sql).executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	@SuppressWarnings("unchecked")
	public List<E> getEntitiesByNativeSQL(String sql) {
		List<E> result = new ArrayList<E>();
		
		try {
			Query query = entityManager.createNativeQuery(sql, clazz());
			result = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public E getEntityByNativeSQL(String sql) {
		try {
			return getEntitiesByNativeSQL(sql).get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
}