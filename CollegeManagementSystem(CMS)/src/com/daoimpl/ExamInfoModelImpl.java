package com.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.dao.ExamInfoModelInterface;
import com.model.ExamInfoModel;
import com.model.SubjectModel;
import com.service.ExamModelServiceInterface;
import com.service.SubjectModelServiceInterface;
import com.serviceimpl.ExamModelServiceImpl;
import com.serviceimpl.SubjectModelServiceImpl;
import com.util.DateUtil;

public class ExamInfoModelImpl implements ExamInfoModelInterface {
	private Connection conn;
	private String sql;
	private PreparedStatement pst;
	private ResultSet rs;

	@Override
	public boolean saveExamInfo(ExamInfoModel model) {
		try {
			conn = DatabaseConnection.connectToDatabase();
			sql = "insert into exam(subject_id,exam_type_id,exam_date,exam_end_date,exam_starttime,exam_endtime,full_marks,pass_marks,status) values(?,?,?,?,?,?,?,?,?)";
			pst = conn.prepareStatement(sql);
			int col = 1;
			pst.setInt(col++, model.getSubjectId());
			pst.setInt(col++, model.getExamTypeId());
			

			Date exam_start_date = model.getExamStartDate();
			java.sql.Date sem_start_date_sql = new java.sql.Date(exam_start_date.getTime()); // converting
			Date exam_end_date =  model.getExamEndDate();
			java.sql.Date sem_end_date_sql = new java.sql.Date(exam_end_date.getTime());
			
			
			pst.setDate(col++, sem_start_date_sql);
			pst.setDate(col++, sem_end_date_sql);
			pst.setString(col++, model.getExamStartTime());
			pst.setString(col++, model.getExamStartTime());
			pst.setInt(col++, model.getFullmarks());
			pst.setInt(col++, model.getPassmarks());
			pst.setInt(col++, model.getStatus());
			int count = pst.executeUpdate();
			if (count > 0) {
				return true;
			}
		} catch (Exception e) {
			System.out.println("Problem in saving exam information" + e);
		} finally {
			try {
				pst.close();
				rs.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return false;

	}

	@Override
	public List<ExamInfoModel> getAllExamInfo() {
		List<ExamInfoModel> examModel = new ArrayList<>();
		try {
			conn = DatabaseConnection.connectToDatabase();
			sql = "select * from exam order by exam_id";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();

			while (rs.next()) {
				ExamInfoModel model = new ExamInfoModel();
				model.setSubjectId(rs.getInt("subject_id"));
				model.setExamTypeId(rs.getInt("exam_type_id"));
				model.setExamStartDate(rs.getDate("exam_date"));
				model.setExamEndDate(rs.getDate("exam_end_date"));
				model.setExamStartTime(rs.getString("exam_starttime"));
				model.setExamEndTime(rs.getString("exam_endtime"));
				model.setFullmarks(rs.getInt("full_marks"));
				model.setPassmarks(rs.getInt("pass_marks"));
				model.setStatus(rs.getInt("status"));
				model.setExamId(rs.getInt("exam_id"));
			int id1=rs.getInt("exam_type_id");
				ExamModelServiceInterface examModelType = new ExamModelServiceImpl();
				model.setExamTypeName(examModelType.getSelectedExam(id1).getExamTypeName());
				
				SubjectModelServiceInterface inter= new SubjectModelServiceImpl();
				Object[] obj1 = new Object[10];
				obj1[0] = rs.getInt("subject_id");
				List<SubjectModel> sub=inter.searchByFields(obj1);
				for (SubjectModel subjectModel : sub) {
					model.setSubjectName(subjectModel.getSubjectName());
				}
				examModel.add(model);
				
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				pst.close();
				rs.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return examModel;
	}

	@Override
	public boolean updateExamInfo(ExamInfoModel model) {
		try {
			conn = DatabaseConnection.connectToDatabase();
			sql = "update  exam set subject_id=?,exam_type_id=?,exam_date=?,exam_end_date=?,exam_starttime=?,exam_endtime=?,full_marks=?,pass_marks=?,status=? where exam_id=?";
			pst = conn.prepareStatement(sql);
			int col = 1;
			pst.setInt(col++, model.getSubjectId());
			pst.setInt(col++, model.getExamTypeId());
			
			Date exam_start_date =  model.getExamStartDate();
			java.sql.Date sem_start_date_sql = new java.sql.Date(exam_start_date.getTime()); // converting
			Date exam_end_date =  model.getExamEndDate();
			java.sql.Date sem_end_date_sql = new java.sql.Date(exam_end_date.getTime());
			
			pst.setDate(col++,sem_start_date_sql);
			pst.setDate(col++, sem_end_date_sql);
			pst.setString(col++, model.getExamStartTime());
			pst.setString(col++, model.getExamEndTime());
			pst.setInt(col++, model.getFullmarks());
			pst.setInt(col++, model.getPassmarks());
			pst.setInt(col++, model.getStatus());
			pst.setInt(col++, model.getExamId());
			int count = pst.executeUpdate();
			if (count > 0) {
				return true;
			}
		} catch (Exception e) {
			System.out.println("update problem =" + e);
		} finally {
			try {
				pst.close();
				rs.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return false;
	}

	@Override
	public int deleteExamInfo(int id) {
		int result = 0;
		try {
			Connection connection = DatabaseConnection.connectToDatabase();
			sql = "delete from exam where exam_id =?";
			pst = connection.prepareStatement(sql);
			pst.setInt(1, id);
			result = pst.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pst.close();
				rs.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return result;
	}

	
	@Override
	public List<ExamInfoModel> searchByField(Object[] obj) {
		List<Object> parameters = new ArrayList<Object>();
		List<ExamInfoModel> examInfoModel = new ArrayList<>();
		
		int exam_id = 0;
		int subject_id = 0;
		int exam_type_id = 0;
		Date exam_date = null;
		String exam_starttime = null;
		String exam_endtime = null;
		int full_marks = 0;
		int pass_marks = 0;
		int status = 0;
		
		int start = 0;
		int limit = 0;

		if (obj[0] != null) {  exam_id = Integer.parseInt(obj[0].toString()); }
		if (obj[1] != null) {  subject_id = Integer.parseInt(obj[1].toString()); }
		if (obj[2] != null) {  exam_type_id = Integer.parseInt(obj[2].toString()); }
		if (obj[3] != null) {
			exam_date = DateUtil.convertToDate(obj[3].toString());
			java.sql.Date exam_date_sql = new java.sql.Date(exam_date.getTime());  
		}
		if (obj[4] != null) {  exam_starttime = obj[4].toString(); }
		if (obj[5] != null) {  exam_endtime = obj[5].toString(); }
		if (obj[6] != null) {  full_marks = Integer.parseInt(obj[6].toString()); }
		if (obj[7] != null) {  pass_marks = Integer.parseInt(obj[7].toString()); }
		if (obj[8] != null) {  status = Integer.parseInt(obj[8].toString()); }
		
		if (obj[9] != null && obj[10] != null) {  
			start = Integer.parseInt(obj[9].toString()); 
			limit = Integer.parseInt(obj[10].toString());
		}
		
		try {
	        StringBuilder query = new StringBuilder("SELECT * FROM exam WHERE 1=1");
	        
			if (exam_id != 0) {
	            query.append(" AND exam_id = ?");
	            parameters.add(exam_id);
	        }
	        if (subject_id != 0) {
	            query.append(" AND subject_id = ?");
	            parameters.add(subject_id);
	        }
	        if (exam_type_id != 0) {
	            query.append(" AND exam_type_id = ?");
	            parameters.add(exam_type_id);
	        }
	        if (exam_starttime != null) {
	            query.append(" AND exam_starttime = ?");
	            parameters.add(exam_starttime);
	        }
	        if (exam_endtime != null) {
	            query.append(" AND exam_endtime = ?");
	            parameters.add(exam_endtime);
	        }
	        if (full_marks != 0) {
	            query.append(" AND full_marks = ?");
	            parameters.add(full_marks);
	        }
	        if (pass_marks != 0) {
	            query.append(" AND pass_marks = ?");
	            parameters.add(pass_marks);
	        }
	        if (status != 0) {
	            query.append(" AND status = ?");
	            parameters.add(status);
	        }
	        if (start != 0 && limit != 0) {
	            query.append(" LIMIT ?, ?");
	            parameters.add(start);
	            parameters.add(limit);
	        }
	        
	        String Query = query.toString();
	        System.out.println(Query);
	        
	        conn = DatabaseConnection.connectToDatabase();
	        pst = conn.prepareStatement(Query);

	        int i = 1;
	        for (Object parameter : parameters) {
	            pst.setObject(i++, parameter);
	        }

	        rs = pst.executeQuery();
	            
	        	while(rs.next()){
	        		ExamInfoModel examModel = new ExamInfoModel();
	        		
	        		examModel.setSubjectId(rs.getInt("subject_id"));
	        		examModel.setExamTypeId(rs.getInt("exam_type_id"));
	        		examModel.setExamStartDate(rs.getDate("exam_date"));
	        		examModel.setExamEndDate(rs.getDate("exam_end_date"));
	        		examModel.setExamStartTime(rs.getString("exam_starttime"));
	        		examModel.setExamEndTime(rs.getString("exam_endtime"));
	        		examModel.setFullmarks(rs.getInt("full_marks"));
	        		examModel.setPassmarks(rs.getInt("pass_marks"));
	        		examModel.setStatus(rs.getInt("status"));
	        		examModel.setExamId(rs.getInt("exam_id"));
					int id1=rs.getInt("exam_type_id");
					ExamModelServiceInterface examModelType = new ExamModelServiceImpl();
					examModel.setExamTypeName(examModelType.getSelectedExam(id1).getExamTypeName());
					
					SubjectModelServiceInterface inter= new SubjectModelServiceImpl();
					Object[] obj1 = new Object[10];
					obj1[0] = rs.getInt("subject_id");
					List<SubjectModel> sub=inter.searchByFields(obj1);
					for (SubjectModel subjectModel : sub) {
						examModel.setSubjectName(subjectModel.getSubjectName());
					}
				

					examInfoModel.add(examModel);
				}
					
	    }  catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				pst.close();
				rs.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		return examInfoModel;
	}

}

