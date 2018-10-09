package cn.bdqn.util;

import java.util.ArrayList;
import java.util.List;

public class PageUtil<T> {
	private int currentPage;//当前页数
	private int pageSize;//每页显示的数据量
	private int startRow;//起始行数
	private int totalCount;//数据总条数
	private int totalPage;//总页数
	private List<T> lists = new ArrayList<T>();//每页显示的数据的集合

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		if (currentPage <= 0) {
			currentPage = 1;
		} else if (currentPage > this.getTotalPage()) {
			if (this.getTotalPage() == 0) {
				currentPage = 1;
			} else {
				currentPage = this.getTotalPage();
			}
		}
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		if (pageSize <= 0) {
			pageSize = 5;
		}
		this.pageSize = pageSize;
	}

	public int getStartRow() {
		return (this.getCurrentPage() - 1) * this.getPageSize();
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		if (this.getTotalCount() % this.getPageSize() == 0) {
			return this.getTotalCount() / this.getPageSize();
		} else {
			return this.getTotalCount() / this.getPageSize() + 1;
		}
	}

	public List<T> getLists() {
		return lists;
	}

	public void setLists(List<T> lists) {
		this.lists = lists;
	}

}
