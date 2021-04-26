  final String query = r"""
                    query GetLaunches($offset:Int!){
                        
                          launchesPast(limit: 15,offset:$offset) {
                            mission_name
                            launch_date_local
                            launch_site {
                              site_name_long
                            }
                            links {
                              article_link
                              video_link
                            }
                            rocket {
                              rocket_name
                                  first_stage {
                                    cores {
                                      core {
                                        reuse_count
                                        status
                                      }
                                    }
                                  }
                            }
                            ships {
                              name
                              home_port
                              image
                            }
                          }
                        }
                    
                  """;

const String detailScreen="/details";